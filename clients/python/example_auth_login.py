"""Example: how an application might look up a user for login.

This is very simplified and is only for learning the structure.
It does NOT include real password hashing/verification.
"""

import sqlite3
from pathlib import Path


def find_user_by_email(conn, email: str):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT id, email, password_hash, is_active
        FROM auth_user
        WHERE email = ?
        """ ,
        (email,),
    )
    return cur.fetchone()


def main() -> None:
    db_path = Path("business.db")
    if not db_path.exists():
        raise SystemExit(
            "Database file business.db not found. "
            "Run scripts/init_sqlite_business.sh or .ps1 first."
        )

    conn = sqlite3.connect(db_path)
    try:
        email = input("Enter email to look up: ").strip()
        user = find_user_by_email(conn, email)
        if user is None:
            print("No user found with that email.")
        else:
            user_id, user_email, password_hash, is_active = user
            print(f"Found user #{user_id} with email {user_email}")
            print(f"Password hash (for demo only): {password_hash}")
            print(f"Is active: {bool(is_active)}")
    finally:
        conn.close()


if __name__ == "__main__":
    main()
