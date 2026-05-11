import paramiko
import os
import shlex
from datetime import datetime

# ================= ENV CONFIG ================= #
# Set TARGET_ENV via env var (dev/stage/prod) or edit default below.
TARGET_ENV = os.getenv("TARGET_ENV", "dev").lower()

ENV_CONFIG = {
    "dev": {
        "SSH_HOST": "1.tcp.in.ngrok.io",
        "SSH_PORT": 20043,
        "SSH_USER": "Solstice-Dev-Server",
        "SSH_PASSWORD": None,  # set if using password
        "SSH_KEY_PATH": "/Users/chayanchakraborty/Downloads/shared-key.pem",  # set if using pem
        "SSH_KEY_PASSPHRASE": None,
        "MYSQL_USER": "admin",
        "MYSQL_PASSWORD": "fMZewU6YGm7mNJycCm1R",
        "MYSQL_HOST": "localhost",
        "MYSQL_PORT": 3306,
        "MYSQL_DUMP_BIN": None,  # auto-detect or set path like "/usr/bin/mysqldump"
        "MYSQL_CLI_BIN": None,   # auto-detect or set path like "/usr/bin/mysql"
        "SCHEMA_ONLY_DBS": [],
        "FULL_DB_LIST": ["shield"],
    },
    "stage": {
        "SSH_HOST": "1.tcp.in.ngrok.io",
        "SSH_PORT": 20152,
        "SSH_USER": "stage-server",
        "SSH_PASSWORD": "Pi@12lite",
        "SSH_KEY_PATH": None,
        "SSH_KEY_PASSPHRASE": None,
        "MYSQL_USER": "admin",
        "MYSQL_PASSWORD": "fMZewU6YGm7mNJycCm1R",
        "MYSQL_HOST": "localhost",
        "MYSQL_PORT": 3307,
        "MYSQL_DUMP_BIN": "/usr/local/mysql/bin/mysqldump",
        "SCHEMA_ONLY_DBS": ["shield", "zeus", "sanchar", "vishanti"],
        "FULL_DB_LIST": ["sanchar", "brahma","shield", "zeus", "sanchar", "vishanti"],
    },
    "prod": {
        "SSH_HOST": "43.205.215.140",
        "SSH_PORT": 22,
        "SSH_USER": "ec2-user",
        "SSH_PASSWORD": None,
        "SSH_KEY_PATH": "/Users/chayanchakraborty/Downloads/prod-jump-host.pem",
        "SSH_KEY_PASSPHRASE": None,
        "MYSQL_USER": "cron_write_user",
        "MYSQL_PASSWORD": "ZNkykJA23xKrHzc",
        "MYSQL_HOST": "solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com",
        "MYSQL_PORT": 3306,
        "MYSQL_DUMP_BIN": None,  # auto-detect
        "MYSQL_CLI_BIN": None,   # auto-detect
        "SCHEMA_ONLY_DBS": ["shield", "zeus", "sanchar", "vishanti"],
        "FULL_DB_LIST": ["sanchar", "brahma"],
    },
}



if TARGET_ENV not in ENV_CONFIG:
    raise ValueError("❌ TARGET_ENV must be one of: dev, stage, prod")

_cfg = ENV_CONFIG[TARGET_ENV]
SSH_HOST = _cfg["SSH_HOST"]
SSH_PORT = _cfg["SSH_PORT"]
SSH_USER = _cfg["SSH_USER"]
SSH_PASSWORD = _cfg["SSH_PASSWORD"]
SSH_KEY_PATH = _cfg["SSH_KEY_PATH"]
SSH_KEY_PASSPHRASE = _cfg["SSH_KEY_PASSPHRASE"]
MYSQL_USER = _cfg["MYSQL_USER"]
MYSQL_PASSWORD = _cfg["MYSQL_PASSWORD"]
MYSQL_HOST = _cfg["MYSQL_HOST"]
MYSQL_PORT = _cfg["MYSQL_PORT"]
MYSQL_DUMP_BIN = _cfg.get("MYSQL_DUMP_BIN")
MYSQL_CLI_BIN = _cfg.get("MYSQL_CLI_BIN")
SCHEMA_ONLY_DBS = _cfg["SCHEMA_ONLY_DBS"]
FULL_DB_LIST = _cfg["FULL_DB_LIST"]
BACKUP_DIR = os.path.join("./backups", TARGET_ENV)

def unique_preserve_order(items):
    seen = set()
    out = []
    for item in items:
        if item in seen:
            continue
        seen.add(item)
        out.append(item)
    return out

# Avoid taking multiple dumps for same DB:
# - de-duplicate each list
# - if DB exists in full list, skip schema dump for that DB
FULL_DB_LIST = unique_preserve_order(FULL_DB_LIST)
SCHEMA_ONLY_DBS = [db for db in unique_preserve_order(SCHEMA_ONLY_DBS) if db not in set(FULL_DB_LIST)]

# ========================================= #

def create_backup_dir():
    os.makedirs(BACKUP_DIR, exist_ok=True)

def get_timestamp():
    return datetime.now().strftime("%Y%m%d_%H%M%S")

def ssh_connect():
    """
    Establish SSH connection with keepalive settings to prevent timeouts.
    """
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    # Connection parameters with keepalive
    connect_kwargs = {
        "hostname": SSH_HOST,
        "port": SSH_PORT,
        "username": SSH_USER,
        "timeout": 30,  # Initial connection timeout
        "banner_timeout": 30,
        "auth_timeout": 30,
    }

    if SSH_KEY_PATH:
        key = paramiko.RSAKey.from_private_key_file(
            SSH_KEY_PATH,
            password=SSH_KEY_PASSPHRASE
        )
        connect_kwargs["pkey"] = key
        client.connect(**connect_kwargs)
        print("🔐 Connected using PEM key")

    elif SSH_PASSWORD:
        connect_kwargs["password"] = SSH_PASSWORD
        client.connect(**connect_kwargs)
        print("🔐 Connected using password")

    else:
        raise Exception("❌ Provide either SSH_PASSWORD or SSH_KEY_PATH")

    # Enable TCP keepalive to prevent connection timeout
    transport = client.get_transport()
    if transport:
        transport.set_keepalive(30)  # Send keepalive every 30 seconds
        print("✅ SSH keepalive enabled (30s interval)")
    
    return client


def check_ssh_connection(ssh):
    """
    Check if SSH connection is still active.
    
    Returns:
        bool: True if active, False otherwise
    """
    try:
        transport = ssh.get_transport()
        if transport and transport.is_active():
            # Send a simple test command
            transport.send_ignore()
            return True
        return False
    except Exception:
        return False

def run_command(ssh, command, timeout=None):
    """
    Execute command over SSH with optional timeout.
    
    Args:
        ssh: Paramiko SSH client
        command: Command to execute
        timeout: Command timeout in seconds (None for no timeout)
    
    Returns:
        tuple: (stdout, stderr) file objects
    """
    # Check if connection is still alive
    transport = ssh.get_transport()
    if not transport or not transport.is_active():
        raise paramiko.SSHException("SSH connection is not active. Reconnection needed.")
    
    try:
        stdin, stdout, stderr = ssh.exec_command(command, timeout=timeout)
        return stdout, stderr
    except Exception as e:
        print(f"⚠️  Command execution failed: {str(e)}")
        raise

def run_bash_command(ssh, command, timeout=None):
    """
    Execute bash command over SSH.
    
    Args:
        ssh: Paramiko SSH client
        command: Command to execute
        timeout: Command timeout in seconds
    
    Returns:
        tuple: (stdout, stderr) file objects
    """
    wrapped = f"bash -lc {shlex.quote(command)}"
    return run_command(ssh, wrapped, timeout=timeout)

def extract_fatal_error(stderr_text):
    if not stderr_text:
        return ""
    fatal_lines = []
    for line in stderr_text.splitlines():
        msg = line.strip()
        if not msg:
            continue
        if "Using a password on the command line interface can be insecure" in msg:
            continue
        fatal_lines.append(msg)
    return "\n".join(fatal_lines)

def get_target_schema_tables(ssh, db):
    list_cmd = (
        f"{MYSQL_CLI_BIN} -h{MYSQL_HOST} -P{MYSQL_PORT} -u{MYSQL_USER} -p'{MYSQL_PASSWORD}' "
        f"-N -e \"SELECT table_name FROM information_schema.tables "
        f"WHERE table_schema='{db}' "
        f"AND (LOWER(table_name) LIKE '%requests' OR LOWER(table_name) LIKE '%request' OR LOWER(table_name) LIKE '%log')\""
    )
    stdout, stderr = run_bash_command(ssh, list_cmd)
    error = extract_fatal_error(stderr.read().decode())
    if error:
        print(f"❌ {db}: failed to fetch table list: {error}")
        return []
    return [line.strip() for line in stdout.read().decode().splitlines() if line.strip()]

def resolve_dump_binary(ssh):
    """
    Resolve the mysqldump or mariadb-dump binary path on remote server.
    Tries multiple detection methods and provides detailed error reporting.
    """
    print("🔍 Detecting MySQL dump binary on remote server...")
    
    # 1. Try configured path first
    if MYSQL_DUMP_BIN:
        print(f"   Checking configured path: {MYSQL_DUMP_BIN}")
        stdout, stderr = run_bash_command(
            ssh,
            f"test -x {shlex.quote(MYSQL_DUMP_BIN)} && echo {shlex.quote(MYSQL_DUMP_BIN)}"
        )
        dump_bin = stdout.read().decode().strip()
        err = stderr.read().decode().strip()
        if dump_bin:
            print(f"✅ Using configured dump binary: {dump_bin}")
            return dump_bin
        print(f"⚠️  Configured MYSQL_DUMP_BIN is not executable: {MYSQL_DUMP_BIN}")
        if err:
            print(f"   Error: {err}")

    # 2. Try to detect using command -v (most reliable)
    print("   Trying 'command -v' detection...")
    detect_cmd = (
        "command -v mysqldump 2>/dev/null || "
        "command -v mariadb-dump 2>/dev/null || "
        "echo ''"
    )
    stdout, stderr = run_bash_command(ssh, detect_cmd)
    dump_bin = stdout.read().decode().strip()
    if dump_bin:
        print(f"✅ Found via 'command -v': {dump_bin}")
        return dump_bin

    # 3. Try common paths manually
    print("   Checking common installation paths...")
    common_paths = [
        "/usr/bin/mysqldump",
        "/usr/local/bin/mysqldump",
        "/usr/local/mysql/bin/mysqldump",
        "/opt/homebrew/bin/mysqldump",
        "/usr/bin/mariadb-dump",
        "/usr/local/bin/mariadb-dump",
    ]
    
    for path in common_paths:
        check_cmd = f"[ -x {shlex.quote(path)} ] && echo {shlex.quote(path)} || echo ''"
        stdout, stderr = run_bash_command(ssh, check_cmd)
        dump_bin = stdout.read().decode().strip()
        if dump_bin:
            print(f"✅ Found at: {dump_bin}")
            return dump_bin

    # 4. Show what's available and try auto-install
    print("⚠️  MySQL dump binary not found. Checking system info...")
    info_cmd = (
        "echo 'OS:' $(uname -a); "
        "echo 'MySQL packages:' $(rpm -qa | grep -i mysql || dpkg -l | grep -i mysql || echo 'none'); "
        "echo 'MariaDB packages:' $(rpm -qa | grep -i mariadb || dpkg -l | grep -i mariadb || echo 'none'); "
        "echo 'PATH:' $PATH"
    )
    stdout, stderr = run_bash_command(ssh, info_cmd)
    print(f"   System info:\n{stdout.read().decode()}")

    print("🔧 Attempting to install MySQL client tools...")
    install_cmd = (
        "if command -v apt-get >/dev/null 2>&1; then "
        "  echo 'Using apt-get...'; "
        "  sudo -n apt-get update -qq 2>&1 && sudo -n apt-get install -y mysql-client 2>&1 | tail -5; "
        "elif command -v dnf >/dev/null 2>&1; then "
        "  echo 'Using dnf...'; "
        "  sudo -n dnf install -y mysql 2>&1 || sudo -n dnf install -y mariadb 2>&1 | tail -5; "
        "elif command -v yum >/dev/null 2>&1; then "
        "  echo 'Using yum...'; "
        "  sudo -n yum install -y mysql 2>&1 || sudo -n yum install -y mariadb 2>&1 | tail -5; "
        "else "
        "  echo 'No supported package manager found (apt-get/dnf/yum)'; "
        "fi"
    )
    stdout, stderr = run_bash_command(ssh, install_cmd)
    install_output = stdout.read().decode()
    print(f"   Install output: {install_output}")

    # 5. Retry detection after install
    print("   Retrying detection after install...")
    stdout, stderr = run_bash_command(ssh, detect_cmd)
    dump_bin = stdout.read().decode().strip()
    if dump_bin:
        print(f"✅ Using dump binary after install: {dump_bin}")
        return dump_bin

    # Check common paths again
    for path in common_paths:
        check_cmd = f"[ -x {shlex.quote(path)} ] && echo {shlex.quote(path)} || echo ''"
        stdout, stderr = run_bash_command(ssh, check_cmd)
        dump_bin = stdout.read().decode().strip()
        if dump_bin:
            print(f"✅ Found after install: {dump_bin}")
            return dump_bin

    # Final failure
    raise RuntimeError(
        "❌ Could not find mysqldump or mariadb-dump on remote server.\n"
        "   Tried:\n"
        "   - Configured path (if set)\n"
        "   - 'command -v mysqldump/mariadb-dump'\n"
        f"   - Common paths: {', '.join(common_paths)}\n"
        "   - Auto-installation attempt\n"
        "\n"
        "   💡 Solutions:\n"
        "   1. Manually install: sudo apt-get install mysql-client (Ubuntu/Debian)\n"
        "                        sudo yum install mysql (RHEL/CentOS)\n"
        "   2. Set MYSQL_DUMP_BIN in ENV_CONFIG for this environment\n"
        "   3. Check if MySQL/MariaDB client tools are in PATH"
    )

def resolve_mysql_cli_binary(ssh):
    """
    Resolve the mysql client binary path on remote server.
    """
    print("🔍 Detecting MySQL client binary on remote server...")
    
    # 1. Try configured path first
    if MYSQL_CLI_BIN:
        print(f"   Checking configured path: {MYSQL_CLI_BIN}")
        stdout, stderr = run_bash_command(
            ssh,
            f"test -x {shlex.quote(MYSQL_CLI_BIN)} && echo {shlex.quote(MYSQL_CLI_BIN)}"
        )
        cli_bin = stdout.read().decode().strip()
        err = stderr.read().decode().strip()
        if cli_bin:
            print(f"✅ Using configured mysql client: {cli_bin}")
            return cli_bin
        print(f"⚠️  Configured MYSQL_CLI_BIN is not executable: {MYSQL_CLI_BIN}")
        if err:
            print(f"   Error: {err}")

    # 2. Try command -v detection
    print("   Trying 'command -v' detection...")
    detect_cmd = "command -v mysql 2>/dev/null || echo ''"
    stdout, stderr = run_bash_command(ssh, detect_cmd)
    cli_bin = stdout.read().decode().strip()
    if cli_bin:
        print(f"✅ Found via 'command -v': {cli_bin}")
        return cli_bin

    # 3. Try common paths
    print("   Checking common installation paths...")
    common_paths = [
        "/usr/bin/mysql",
        "/usr/local/bin/mysql",
        "/usr/local/mysql/bin/mysql",
        "/opt/homebrew/bin/mysql",
    ]
    
    for path in common_paths:
        check_cmd = f"[ -x {shlex.quote(path)} ] && echo {shlex.quote(path)} || echo ''"
        stdout, stderr = run_bash_command(ssh, check_cmd)
        cli_bin = stdout.read().decode().strip()
        if cli_bin:
            print(f"✅ Found at: {cli_bin}")
            return cli_bin

    raise RuntimeError(
        "❌ MySQL client binary not found on remote server (needed for table discovery).\n"
        "   Tried:\n"
        "   - Configured path (if set)\n"
        "   - 'command -v mysql'\n"
        f"   - Common paths: {', '.join(common_paths)}\n"
        "\n"
        "   💡 Install with: sudo apt-get install mysql-client or sudo yum install mysql"
    )

def dump_schema_dbs(ssh):
    print("🔹 Schema-only backups...")

    for db in SCHEMA_ONLY_DBS:
        # Check SSH connection before each database
        if not check_ssh_connection(ssh):
            print(f"❌ SSH connection lost before processing {db}")
            raise paramiko.SSHException("SSH connection is no longer active")
        
        print(f"\n📦 Processing schema dump for: {db}")
        filename = f"{db}_schema_{get_timestamp()}.sql"
        filepath = os.path.join(BACKUP_DIR, filename)

        tables = get_target_schema_tables(ssh, db)
        if not tables:
            print(f"⚠️  {db}: no tables ending with requests/request/log; skipping schema dump")
            continue
        
        print(f"   Found {len(tables)} tables to dump schema for")
        table_args = " ".join(tables)
        cmd = (
            f"{MYSQL_DUMP_BIN} -h{MYSQL_HOST} -P{MYSQL_PORT} -u{MYSQL_USER} -p'{MYSQL_PASSWORD}' "
            f"--no-data --no-tablespaces --single-transaction --skip-lock-tables {db} {table_args}"
        )

        try:
            # Longer timeout for dump operations (10 minutes)
            stdout, stderr = run_bash_command(ssh, cmd, timeout=600)
            error = extract_fatal_error(stderr.read().decode())

            if error:
                print(f"❌ {db}: {error}")
                continue

            with open(filepath, "w", encoding="utf-8") as f:
                for line in stdout:
                    f.write(line)

            print(f"✅ Schema backup completed: {filepath}")
        except Exception as e:
            print(f"❌ {db}: Schema dump failed - {str(e)}")
            continue

def dump_full_dbs(ssh):
    print("🔹 Full DB backups...")

    for db in FULL_DB_LIST:
        # Check SSH connection before each database
        if not check_ssh_connection(ssh):
            print(f"❌ SSH connection lost before processing {db}")
            raise paramiko.SSHException("SSH connection is no longer active")
        
        print(f"\n📦 Processing full dump for: {db}")
        filename = f"{db}_full_{get_timestamp()}.sql"
        filepath = os.path.join(BACKUP_DIR, filename)

        schema_only_tables = get_target_schema_tables(ssh, db)
        ignore_table_flags = " ".join([f"--ignore-table={db}.{t}" for t in schema_only_tables])
        if schema_only_tables:
            print(f"ℹ️  {db}: excluding data for {len(schema_only_tables)} request/log tables")

        try:
            # 1) Dump full DB excluding request/log tables entirely.
            print(f"   Step 1/2: Dumping main data...")
            cmd_data = (
                f"{MYSQL_DUMP_BIN} -h{MYSQL_HOST} -P{MYSQL_PORT} -u{MYSQL_USER} -p'{MYSQL_PASSWORD}' "
                f"--no-tablespaces --single-transaction --skip-lock-tables "
                f"{ignore_table_flags} {db}"
            )
            
            # Longer timeout for full dumps (20 minutes)
            stdout_data, stderr_data = run_bash_command(ssh, cmd_data, timeout=1200)
            error_data = extract_fatal_error(stderr_data.read().decode())
            if error_data:
                print(f"❌ {db}: {error_data}")
                continue

            with open(filepath, "w", encoding="utf-8") as f:
                bytes_written = 0
                for line in stdout_data:
                    f.write(line)
                    bytes_written += len(line.encode('utf-8'))
                
                # Show progress every 10MB
                if bytes_written > 10_000_000:
                    print(f"   Written: {bytes_written / 1_000_000:.1f} MB...")

            print(f"   Step 1/2: Main data completed ({bytes_written / 1_000_000:.2f} MB)")

            # 2) Append schema-only for excluded request/log tables.
            if schema_only_tables:
                print(f"   Step 2/2: Appending schema for {len(schema_only_tables)} excluded tables...")
                table_args = " ".join(schema_only_tables)
                cmd_schema = (
                    f"{MYSQL_DUMP_BIN} -h{MYSQL_HOST} -P{MYSQL_PORT} -u{MYSQL_USER} -p'{MYSQL_PASSWORD}' "
                    f"--no-data --no-tablespaces --single-transaction --skip-lock-tables {db} {table_args}"
                )
                
                stdout_schema, stderr_schema = run_bash_command(ssh, cmd_schema, timeout=600)
                error_schema = extract_fatal_error(stderr_schema.read().decode())
                if error_schema:
                    print(f"❌ {db}: schema append failed: {error_schema}")
                    continue
                
                with open(filepath, "a", encoding="utf-8") as f:
                    f.write("\n\n-- Schema-only tables (request/log)\n")
                    for line in stdout_schema:
                        f.write(line)
                
                print(f"   Step 2/2: Schema appended successfully")

            file_size = os.path.getsize(filepath) / 1_000_000
            print(f"✅ Full backup completed: {filepath} ({file_size:.2f} MB)")
            
        except paramiko.SSHException as e:
            print(f"❌ {db}: SSH connection error - {str(e)}")
            print(f"   This usually happens with large databases or slow connections.")
            print(f"   Consider:")
            print(f"   1. Running dump directly on the server")
            print(f"   2. Increasing SSH keepalive frequency")
            print(f"   3. Using compression to reduce transfer time")
            raise  # Re-raise to stop processing
        except Exception as e:
            print(f"❌ {db}: Full dump failed - {str(e)}")
            continue

def main():
    print("="*60)
    print("🚀 MySQL Database Backup Script")
    print("="*60)
    create_backup_dir()
    print(f"🌍 Environment: {TARGET_ENV}")
    print(f"📡 Source SSH: {SSH_USER}@{SSH_HOST}:{SSH_PORT}")
    print(f"🗄️ Source MySQL: {MYSQL_HOST}:{MYSQL_PORT} (user: {MYSQL_USER})")
    print(f"💾 Backup directory: {BACKUP_DIR}")
    print(f"📋 Schema-only DBs: {SCHEMA_ONLY_DBS}")
    print(f"📦 Full backup DBs: {FULL_DB_LIST}")
    print("="*60)
    
    ssh = None
    try:
        ssh = ssh_connect()

        global MYSQL_DUMP_BIN, MYSQL_CLI_BIN
        MYSQL_DUMP_BIN = resolve_dump_binary(ssh)
        MYSQL_CLI_BIN = resolve_mysql_cli_binary(ssh)
        
        print("\n" + "="*60)
        print("Starting backup operations...")
        print("="*60)
        
        dump_schema_dbs(ssh)
        dump_full_dbs(ssh)
        
        print("\n" + "="*60)
        print("✅ All backups completed successfully!")
        print("="*60)
        
    except RuntimeError as e:
        print(f"\n{'='*60}")
        print("❌ BACKUP FAILED")
        print("="*60)
        print(str(e))
        print("="*60)
        raise
    except Exception as e:
        print(f"\n{'='*60}")
        print("❌ UNEXPECTED ERROR")
        print("="*60)
        print(f"Error: {str(e)}")
        import traceback
        traceback.print_exc()
        print("="*60)
        raise
    finally:
        if ssh:
            ssh.close()
            print("\n🔐 SSH connection closed")

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n⚠️  Backup interrupted by user (Ctrl+C)")
    except Exception:
        print("\n\n💡 Check the error messages above for troubleshooting steps.")
        exit(1)