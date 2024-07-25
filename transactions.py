import mysql.connector
import logging
from mysql.connector import errorcode

logger = logging.getLogger()
logger.setLevel(logging.INFO)
handler = logging.StreamHandler()
formatter = logging.Formatter('%(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)

def dbConnect(attempts = 3):
    """
    Attempts to establish connection with MySQL database
    and execute transactions from user inputs.

    Parameters:
    ----------
    attempts (int): Maximum allowed attempts for database connection
    """
    attempt = 0
    while attempt < attempts:
        db_host = input("Enter host: ")
        db_user = input("Enter user: ")
        db_password = input("Enter password: ")
        db_name = input("Enter name of database: ")

        try:
            db_connect = mysql.connector.connect(
                host = db_host,
                user = db_user,
                password = db_password,
                database = db_name
            )
            logging.info("MySQL database connection successful")
            """
            TO-DO Here:
                * get user input for transactions
                * execute transactions into db
                * log success or error messages
            """
            db_connect.close()
            return
        
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                logging.error("Incorrect username or password")
            elif err.errno == errorcode.ER_BAD_DB_ERROR:
                logging.error("Unable to locate database")
            else:
                logging.error(err)
            attempt += 1
            if attempt < attempts:
                logging.warning(f"Please try again, remaining attempts {attempts - attempt}")
            else:
                logging.warning("Maximum number of attempts reached, exiting")
            
if __name__ == '__main__':
    dbConnect()
