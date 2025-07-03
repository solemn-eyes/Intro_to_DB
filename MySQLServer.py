import mysql.connector
import  pymysql
from pymysql import MySQLError

try:
    # Connecting to MySQL server
    mysqlConnector = mysql.connector.connect(
        host='localhost',
        user='root',
        password='password'
    )
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='password'
    )

    cursor = connection.cursor()
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("✅ Database 'alx_book_store' created successfully!")

except mysql.connector.Error as error:
    print("There's an error!")
except MySQLError as err:
    print(f"❌ Error: {err}")

finally:
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.open:
        connection.close()
        print(" MySQL connection closed.")
    