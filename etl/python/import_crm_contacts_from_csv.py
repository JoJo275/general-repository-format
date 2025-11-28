"""Simple ETL example: import CRM contacts from a CSV file into SQLite.

This script is heavily commented for beginners.
It assumes the CRM tables already exist.
"""

import csv
import sqlite3
from pathlib import Path


def main() -> None:
    # Path to the CSV with columns: account_name, first_name, last_name, email
    csv_path = Path("data/csv/new_contacts.csv")
    db_path = Path("business.db")

    if not csv_path.exists():
        raise SystemExit(f"CSV file not found: {csv_path}")

    conn = sqlite3.connect(db_path)
    try:
        cur = conn.cursor()

        with csv_path.open(newline="", encoding="utf-8") as f:
            reader = csv.DictReader(f)
            for row in reader:
                # 1) Find or create the account
                account_name = row["account_name"]
                cur.execute(
                    """
                    SELECT id
                    FROM crm_account
                    WHERE name = ?
                    """,
                    (account_name,),
                )
                account = cur.fetchone()
                if account is None:
                    # Insert a new account
                    cur.execute(
                        """
                        INSERT INTO crm_account (name)
                        VALUES (?)
                        """,
                        (account_name,),
                    )
                    account_id = cur.lastrowid
                else:
                    account_id = account[0]

                # 2) Insert the contact linked to that account
                cur.execute(
                    """
                    INSERT INTO crm_contact (account_id, first_name, last_name, email)
                    VALUES (?, ?, ?, ?)
                    """ ,
                    (
                        account_id,
                        row["first_name"],
                        row["last_name"],
                        row.get("email"),
                    ),
                )

        conn.commit()
        print("Import completed successfully.")
    finally:
        conn.close()


if __name__ == "__main__":
    main()
