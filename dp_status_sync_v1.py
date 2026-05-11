import mysql.connector
import logging
from datetime import datetime

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - [%(funcName)s] - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)

logger = logging.getLogger(__name__)

# Database configurations
db_configs = {
    'local':{
        'user': 'root',
        'password': 'Chayan@1340',
        'host': 'localhost',
        'database': 'cms',
        'port' : 3306
    },
    'prod':{
        'user': 'solstice_admin',
        'password': 'MrVr3pyh9SsQ32usWtBK',
        'host': 'solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com',
        'database': 'shield',
        'port' : 3306
    }
    # Add more databases as needed
}


def get_db_config(name):
    """
    Get database configuration by environment name.
    
    Args:
        name: Environment name (local, prod, etc.)
    
    Returns:
        dict: Database configuration or None
    """
    logger.info(f"Fetching database configuration for environment: '{name}'")
    config = db_configs.get(name)
    
    if config:
        logger.info(f"Configuration found for '{name}' - Host: {config.get('host')}, Database: {config.get('database')}")
    else:
        logger.error(f"No configuration found for environment: '{name}'")
        logger.error(f"Available environments: {list(db_configs.keys())}")
    
    return config


# Function to fetch data from a database
def fetch_data_from_db(db_config, query):
    """
    Fetch data from database using provided configuration and query.
    
    Args:
        db_config: Database configuration dict
        query: SQL query to execute
    
    Returns:
        list: Query results or empty list on error
    """
    connection = None
    cursor = None
    
    try:
        logger.info(f"Connecting to database: {db_config['database']} at {db_config['host']}:{db_config['port']}")
        connection = mysql.connector.connect(**db_config)
        logger.info("Database connection established successfully")
        
        cursor = connection.cursor(dictionary=True)
        logger.info(f"Executing query: {query}")
        
        cursor.execute(query)
        data = cursor.fetchall()
        
        row_count = len(data)
        logger.info(f"Query executed successfully - Retrieved {row_count} row(s)")
        
        if row_count > 0:
            logger.debug(f"First row sample: {data[0]}")
        
        return data
        
    except mysql.connector.Error as err:
        logger.error(f"Database error occurred: {err}")
        logger.error(f"Error code: {err.errno if hasattr(err, 'errno') else 'N/A'}")
        logger.error(f"SQL State: {err.sqlstate if hasattr(err, 'sqlstate') else 'N/A'}")
        return []
        
    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}", exc_info=True)
        return []
        
    finally:
        if cursor:
            cursor.close()
            logger.debug("Database cursor closed")
        if connection:
            connection.close()
            logger.info("Database connection closed")
            logger.info("="*60)


def main(environment_name):
    """
    Main function to execute database query for given environment.
    
    Args:
        environment_name: Target environment (local, prod, etc.)
    """
    logger.info("="*60)
    logger.info("Starting DP Status Sync Script")
    logger.info(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    logger.info(f"Target Environment: {environment_name}")
    logger.info("="*60)
    
    query = f"SELECT COUNT(*) FROM app_user_v2 au LIMIT 5;"
    logger.info(f"Query to execute: {query}")
    
    all_data = []

    # Get database configuration
    db_config = get_db_config(environment_name)
    
    if not db_config:
        logger.error("Failed to get database configuration. Aborting.")
        return
    
    # Fetch data from database
    logger.info("Starting data fetch operation...")
    data = fetch_data_from_db(db_config, query)
    
    if data:
        all_data.extend(data)
        logger.info(f"Data fetch completed - Total records collected: {len(all_data)}")
        logger.info(f"Results: {all_data}")
    else:
        logger.warning("No data retrieved from database")
    
    logger.info("="*60)
    logger.info("DP Status Sync Script completed")
    logger.info("="*60)

# Main script
if __name__ == "__main__":
    import argparse
    
    logger.info("Script started via direct execution")
    
    # Uncomment to use command-line arguments
    # parser = argparse.ArgumentParser(description='Process environment name.')
    # parser.add_argument('environment_name', type=str, help='Environment name (e.g., prod, uat, dev)')
    # args = parser.parse_args()
    # main(args.environment_name)
    
    # Direct execution with hardcoded environment
    try:
        main('prod')
    except KeyboardInterrupt:
        logger.warning("Script interrupted by user (Ctrl+C)")
    except Exception as e:
        logger.error(f"Fatal error in main execution: {str(e)}", exc_info=True)
    finally:
        logger.info("Script execution finished")
