# Secure Web Assignement
 
📚Project: A Library Management System
💻Framework Used: Html, Css, Python - Flask with the database running on MySQL. I used the XAMPP panel to run my MySQL database. 
🔒Security Implementations: The following security requirements influenced the security implementations, I added to the web application
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

👾Challenges Experienced:
One of my challenges was trying to implement Flask Talisman to handle the content security headers, https traffic management and CSRF handling but it didn’t work. However the silver lining is that I got to understand it better works in a production environment. The work around  of using it in a development environment is to use a SSL server and use the generated keys. 
✔️Lessons Learnt: 
The project has offered a nice learning challenge which has allowed me to better understand secure web practices. The research concept of vetting which security implementations to implement over which. I.e, password hashing vs encryption, using bcrypt or scrypt, I have learnt alot. 

