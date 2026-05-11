import re
from pathlib import Path
from typing import List, Tuple

BATCH_SIZE = 500
TABLE_NAME = "project_media_galleries"


def extract_values(sql_text: str) -> List[Tuple[int, str]]:
    """
    Extract (id, image_url) tuples from PostgreSQL VALUES clause
    """
    pattern = re.compile(r"\(\s*(\d+)\s*,\s*'([^']+)'\s*\)")
    return [(int(m.group(1)), m.group(2)) for m in pattern.finditer(sql_text)]


def chunked(data: List[Tuple[int, str]], size: int):
    for i in range(0, len(data), size):
        yield data[i:i + size]


def generate_mysql_update(batch: List[Tuple[int, str]]) -> str:
    union_selects = []
    for id_, url in batch:
        escaped_url = url.replace("'", "\\'")
        union_selects.append(
            f"SELECT {id_} AS id, '{escaped_url}' AS image_url"
        )

    derived_table = "\n    UNION ALL\n    ".join(union_selects)

    return f"""
UPDATE {TABLE_NAME} t
JOIN (
    {derived_table}
) v ON t.id = v.id
SET t.image_url = v.image_url,
    t.updated_at = NOW();
""".strip()


def convert_postgres_to_mysql(input_sql_path: str, output_sql_path: str):
    sql_text = Path(input_sql_path).read_text()
    values = extract_values(sql_text)

    if not values:
        raise ValueError("No (id, image_url) pairs found")

    mysql_queries = []

    for batch in chunked(values, BATCH_SIZE):
        mysql_queries.append(generate_mysql_update(batch))

    Path(output_sql_path).write_text("\n\n".join(mysql_queries))
    print(f"✅ Generated {len(mysql_queries)} MySQL batch queries")


if __name__ == "__main__":
    convert_postgres_to_mysql(
        input_sql_path="postgres_update.sql",
        output_sql_path="mysql_updates.sql"
    )
