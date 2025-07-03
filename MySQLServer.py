import  pymysql
from pymysql import MySQLError

try:
    # Connecting to MySQL server
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='password'
    )

    cursor = connection.cursor()
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("✅ Database 'alx_book_store' created successfully!")

except MySQLError as err:
    print(f"❌ Error: {err}")

finally:
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.open:
        connection.close()
        print(" MySQL connection closed.")
    