# Secure Web Assignement
👩🏾‍💻Module: Secure Web Development
👩🏾‍🎓Credentials: Jacklyne Mbuthia -x23318104
📚Project: A Library Management System
💻Framework Used: Html, Css, Python - Flask with the database running on MySQL. I used the XAMPP panel to run my MySQL database. 
🔒Security Requirements: The following security requirements influenced the security implementations, I added to the web application
👥1.	Authentication
1.1	Secure password creation: The existing password creation process was not adhering to the password best practices. The length and strength of the password is not checked. 
1.2	Password hashing: passwords stored in the database, were stored in plain text. 
🍪2.	Session management
2.1	Cookie management: the initiation of sessions is not accompanied by cookies at login and logout. Secure cookies provide protection against the OWASP security issues like SQL-Injection, Cross Site Scripting
2.2	Session ID regeneration: The sessions had no expiry set neither was it regenerated at login. 
⛔3.	Rate limiting
3.1	Login attempts: login attempts had no limit, opening the system for brute forcing 
3.2	Rate limiting: the entire application had no rate limiting set, allowing for distributed denial of attack on it. 
🚦4.	Traffic management 
4.1 The web application did not have CSRF protection in place or a library that ensured that traffic was transmitted securely.
👩🏾‍💻5.	Secure code structure
5.1 Code refactoring: The existing code had its configuration details and secret keys in the main app.py file. Exposing such information on GitHub poses a security risk to the application, affecting its integrity and confidentiality.
🔐Security Implementations; I implemented the following security strategies:

1.	Authentication
Secure password creation: I implemented a password check that ensured that passwords created were 8 hours minimum long and had a blend of numerical, alphanumeric and special characters combination. If the user enters a password that does not match the criteria, it throws an error forcing them to reenter the password. 
Password hashing and validation: I utilized the scrypt hashing library to secure the passwords. 
2.	Session Management
Cookie management: I added cookies with the following attributes: secure, HTTP only same site & age. 
Session ID regeneration: I implemented the code to ensure that session IDs are regenerated upon login.
3.	Rate Limiting
I implemented rate limiting using the flask_limiter library both at a global level, to cover the application and on the login route, limiting logins to 5 attempts per minute  to achieve a granular implementation.
4.	Traffic Management
I utilized Flask Talisman,  a python library that ensures that traffic is transmitted over HTTPs, Secure content headers and CSRF protection However,  it didn’t work. I discovered that Talisman better supports production over development environments. The work around of using it in development is installing an SSL server and using the certificate and keys generated. 
5.	Secure Code Structure
Code Refactoring: I separated the configuration details and the secret key and created a separate config file for them which I ensured would be ignored by GitHub during commits. 


👾Challenges Experienced:
One of my challenges was trying to implement Flask Talisman to handle the content security headers, https traffic management and CSRF handling but it didn’t work. However the silver lining is that I got to understand it better works in a production environment. The work around  of using it in a development environment is to use a SSL server and use the generated keys. 
✔️Lessons Learnt: 
The project has offered a nice learning challenge which has allowed me to better understand secure web practices. The research concept of vetting which security implementations to implement over which. I.e, password hashing vs encryption, using bcrypt or scrypt, I have learnt alot. 


