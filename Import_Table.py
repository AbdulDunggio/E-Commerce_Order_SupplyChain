#import table customers

import pandas as pd
import mysql.connector
from mysql.connector import Error

# Fungsi untuk menghubungkan ke MySQL
def create_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',  # atau IP server MySQL
            user='root',       # username MySQL
            password='*****',  # password MySQL
            database='My_Portfolio'  # nama database yang sudah ada
        )
        if connection.is_connected():
            print("Successfully connected to MySQL")
            return connection
    except Error as e:
        print("Error while connecting to MySQL", e)
        return None

# Fungsi untuk mengimpor CSV ke MySQL
def import_csv_to_mysql(csv_file, table_name):
    connection = create_connection()
    if connection:
        try:
            # Membaca CSV menggunakan pandas
            df = pd.read_csv(csv_file)
            
            # Menulis data ke MySQL menggunakan pandas.to_sql()
            # NOTE: Agar dapat menggunakan to_sql, Anda memerlukan SQLAlchemy
            from sqlalchemy import create_engine
            engine = create_engine('mysql+mysqlconnector://root:Mamapapa2212@localhost/My_Portfolio')
            
            # Menulis data ke tabel MySQL
            df.to_sql(table_name, con=engine, if_exists='replace', index=False)
            print(f"Data from {csv_file} has been imported successfully to {table_name}")
        
        except Exception as e:
            print(f"Error importing CSV to MySQL: {e}")
        finally:
            connection.close()

# Tentukan file CSV dan nama tabel yang akan diimpor
csv_file = 'F:/Data Analyst/SQL/df_Customers.csv'  # Ganti dengan path ke file CSV Anda
table_name = 'customers'  # Ganti dengan nama tabel yang ingin Anda impor data

# Panggil fungsi untuk mengimpor data
import_csv_to_mysql(csv_file, table_name)

#import table orderitems

import pandas as pd
import mysql.connector
from mysql.connector import Error

# Fungsi untuk menghubungkan ke MySQL
def create_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',  # atau IP server MySQL
            user='root',       # username MySQL
            password='****',  # password MySQL
            database='My_Portfolio'  # nama database yang sudah ada
        )
        if connection.is_connected():
            print("Successfully connected to MySQL")
            return connection
    except Error as e:
        print("Error while connecting to MySQL", e)
        return None

# Fungsi untuk mengimpor CSV ke MySQL
def import_csv_to_mysql(csv_file, table_name):
    connection = create_connection()
    if connection:
        try:
            # Membaca CSV menggunakan pandas
            df = pd.read_csv(csv_file)
            
            # Menulis data ke MySQL menggunakan pandas.to_sql()
            # NOTE: Agar dapat menggunakan to_sql, Anda memerlukan SQLAlchemy
            from sqlalchemy import create_engine
            engine = create_engine('mysql+mysqlconnector://root:Mamapapa2212@localhost/My_Portfolio')
            
            # Menulis data ke tabel MySQL
            df.to_sql(table_name, con=engine, if_exists='replace', index=False)
            print(f"Data from {csv_file} has been imported successfully to {table_name}")
        
        except Exception as e:
            print(f"Error importing CSV to MySQL: {e}")
        finally:
            connection.close()

# Tentukan file CSV dan nama tabel yang akan diimpor
csv_file = 'F:/Data Analyst/SQL/df_OrderItems.csv'  # Ganti dengan path ke file CSV Anda
table_name = 'order_items'  # Ganti dengan nama tabel yang ingin Anda impor data

# Panggil fungsi untuk mengimpor data
import_csv_to_mysql(csv_file, table_name)

#import table orders
import pandas as pd
import mysql.connector
from mysql.connector import Error

# Fungsi untuk menghubungkan ke MySQL
def create_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',  # atau IP server MySQL
            user='root',       # username MySQL
            password='****',  # password MySQL
            database='My_Portfolio'  # nama database yang sudah ada
        )
        if connection.is_connected():
            print("Successfully connected to MySQL")
            return connection
    except Error as e:
        print("Error while connecting to MySQL", e)
        return None

# Fungsi untuk mengimpor CSV ke MySQL
def import_csv_to_mysql(csv_file, table_name):
    connection = create_connection()
    if connection:
        try:
            # Membaca CSV menggunakan pandas
            df = pd.read_csv(csv_file)
            
            # Menulis data ke MySQL menggunakan pandas.to_sql()
            # NOTE: Agar dapat menggunakan to_sql, Anda memerlukan SQLAlchemy
            from sqlalchemy import create_engine
            engine = create_engine('mysql+mysqlconnector://root:Mamapapa2212@localhost/My_Portfolio')
            
            # Menulis data ke tabel MySQL
            df.to_sql(table_name, con=engine, if_exists='replace', index=False)
            print(f"Data from {csv_file} has been imported successfully to {table_name}")
        
        except Exception as e:
            print(f"Error importing CSV to MySQL: {e}")
        finally:
            connection.close()

# Tentukan file CSV dan nama tabel yang akan diimpor
csv_file = 'F:/Data Analyst/SQL/df_Orders.csv'  # Ganti dengan path ke file CSV Anda
table_name = 'orders'  # Ganti dengan nama tabel yang ingin Anda impor data

# Panggil fungsi untuk mengimpor data
import_csv_to_mysql(csv_file, table_name)

# import table payments
import pandas as pd
import mysql.connector
from mysql.connector import Error

# Fungsi untuk menghubungkan ke MySQL
def create_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',  # atau IP server MySQL
            user='root',       # username MySQL
            password='****',  # password MySQL
            database='My_Portfolio'  # nama database yang sudah ada
        )
        if connection.is_connected():
            print("Successfully connected to MySQL")
            return connection
    except Error as e:
        print("Error while connecting to MySQL", e)
        return None

# Fungsi untuk mengimpor CSV ke MySQL
def import_csv_to_mysql(csv_file, table_name):
    connection = create_connection()
    if connection:
        try:
            # Membaca CSV menggunakan pandas
            df = pd.read_csv(csv_file)
            
            # Menulis data ke MySQL menggunakan pandas.to_sql()
            # NOTE: Agar dapat menggunakan to_sql, Anda memerlukan SQLAlchemy
            from sqlalchemy import create_engine
            engine = create_engine('mysql+mysqlconnector://root:Mamapapa2212@localhost/My_Portfolio')
            
            # Menulis data ke tabel MySQL
            df.to_sql(table_name, con=engine, if_exists='replace', index=False)
            print(f"Data from {csv_file} has been imported successfully to {table_name}")
        
        except Exception as e:
            print(f"Error importing CSV to MySQL: {e}")
        finally:
            connection.close()

# Tentukan file CSV dan nama tabel yang akan diimpor
csv_file = 'F:/Data Analyst/SQL/df_Payments.csv'  # Ganti dengan path ke file CSV Anda
table_name = 'payments'  # Ganti dengan nama tabel yang ingin Anda impor data

# Panggil fungsi untuk mengimpor data
import_csv_to_mysql(csv_file, table_name)

#Import Table Products
import pandas as pd
import mysql.connector
from mysql.connector import Error

# Fungsi untuk menghubungkan ke MySQL
def create_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',  # atau IP server MySQL
            user='root',       # username MySQL
            password='****',  # password MySQL
            database='My_Portfolio'  # nama database yang sudah ada
        )
        if connection.is_connected():
            print("Successfully connected to MySQL")
            return connection
    except Error as e:
        print("Error while connecting to MySQL", e)
        return None

# Fungsi untuk mengimpor CSV ke MySQL
def import_csv_to_mysql(csv_file, table_name):
    connection = create_connection()
    if connection:
        try:
            # Membaca CSV menggunakan pandas
            df = pd.read_csv(csv_file)
            
            # Menulis data ke MySQL menggunakan pandas.to_sql()
            # NOTE: Agar dapat menggunakan to_sql, Anda memerlukan SQLAlchemy
            from sqlalchemy import create_engine
            engine = create_engine('mysql+mysqlconnector://root:Mamapapa2212@localhost/My_Portfolio')
            
            # Menulis data ke tabel MySQL
            df.to_sql(table_name, con=engine, if_exists='replace', index=False)
            print(f"Data from {csv_file} has been imported successfully to {table_name}")
        
        except Exception as e:
            print(f"Error importing CSV to MySQL: {e}")
        finally:
            connection.close()

# Tentukan file CSV dan nama tabel yang akan diimpor
csv_file = 'F:/Data Analyst/SQL/df_Products.csv'  # Ganti dengan path ke file CSV Anda
table_name = 'products'  # Ganti dengan nama tabel yang ingin Anda impor data

# Panggil fungsi untuk mengimpor data
import_csv_to_mysql(csv_file, table_name)
