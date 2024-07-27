import mysql.connector
import logging
import getpass
from mysql.connector import errorcode

"""
Reference: Based off examples provided from MySQL connecter documentation
URL: https://dev.mysql.com/doc/connector-python/en/connector-python-example-connecting.html
"""
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
formatter = logging.Formatter("%(asctime)s - %(levelname)s: %(message)s")
handler = logging.StreamHandler()
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
        db_password = getpass.getpass("Enter password: ") #Mask password input
        db_name = input("Enter name of database: ")

        #Connect to database
        try:
            db_connect = mysql.connector.connect(
                host = db_host,
                user = db_user,
                password = db_password,
                database = db_name
            )
            logger.info("MySQL database connection successful")

            #Keep looping transactions until user prompts exit
            while True:
                transaction = input("Enter your transaction: ")
                cursor = db_connect.cursor()
                try:
                    cursor.execute(transaction)
                    db_connect.commit()
                    logger.info("Transaction successfuly executed")
                except mysql.connector.Error as err:
                    logger.error(err)
                    db_connect.rollback()
                    logger.info("Transaction rolled back") #Rollback if any errors occur during transaction
                state = input("Do you want to execute another transaction Y/N: ").upper()
                if state != 'Y':
                    logger.info("Closing connection to database....")
                    break
            db_connect.close()
            return
        
        #Error handling
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                logger.error("Incorrect username or password")
            elif err.errno == errorcode.ER_BAD_DB_ERROR:
                logger.error("Unable to locate database")
            else:
                logger.error(err)
            attempt += 1
            if attempt < attempts:
                logger.warning(f"Please try again, remaining attempts {attempts - attempt}")
            else:
                logger.warning("Maximum number of attempts reached, exiting")
            
if __name__ == '__main__':
    dbConnect()
