#i've moved the secret key and the database configuration details from the app file so that i can refer to it from the app.py file.I will also be adding this file to the git ignore for it not to be pushed to github. 
#Credentials in plaintext on github are the easiest way an attacker can take full control of a web application. 

# For the secret key

SECRET_KEY = 'abcd2123445' 

# The database Configuration details:

MYSQL_HOST = 'localhost'
MYSQL_USER = 'root'
MYSQL_PASSWORD = ''
MYSQL_DB = 'library-system'
MYSQL_PORT = 3306
