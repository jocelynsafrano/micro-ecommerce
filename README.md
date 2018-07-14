# What does this project do ?

This is one of school project. It's an e-commerce website.

# What technologies are used for this project ?

I've used both back-end and front-end technologies and they're listed as follows

- **Back-end**
    1. PHP (POO/MVC)
    2. [Genos Propretary PHP Micro Framework](http://genos.vlis-france.com/)

- **Front-end**
    1. HTML5
    2. CSS3
    3. Bootstrap 4
    4. Javascript Vanilla
    5. jQuery v3.3.1
    6. AJAX using jQuery

# How long did it take to make this website ?

It took me an average of 60 hours to have the desired functionnalities as asked by my mentor.
Which means it took me 3 times less than my first project which is a similar one to which I had to develop my own micro framework [you can find here](https://github.com/eljaouharihamza/cles_perdu)

# How to deploy the project ?

Here are the steps which will guide you through deploying your copy of the project

## Requirements and steps

1. Install a LAMP/WAMP/WAMPP or use a hosted web Server
2. Clone the repository into the server' correct location (It depends on which OS and on which web sever you're using...please refer to the proper docuementation for more information)
3. Import the database file called "mini-ecommerce.sql" located under the root directory (it has some test data)

Maybe if your local server credentials are not set to default meaning having a username called root and an empty pasword try following the last step

4. Open the /sdk/genos/config.genis.php file and edit the following lines according to your personal settings

```php
	$DATABASE_USER ='root'; // Database username
	$DATABASE_PSWD =''; // Database password
```

# Technical Documentation Briefing

## How does the application work ?

1. **Routing and the Router' location**

At each HTTP request, the website uses the parameters in the url to call the proper action within a specific class using the "controller" and the "action" variables. With that been said "controller" holds the name of the class to instanciate while "action" holds the name of the specific function to call.

This procedure is called routing and its router is found at the publicly accessible location where all the data is rendered : /public/index.php

> The /public folder must have 777 access rights in order for the users to access the application!

1. **Application' architecture** 

| Folder or File        | Function          | Comments  |
| ------------- |-------------| -----|
| /class      | Containes the appliciation' merged controller and database models |  |
| /public      | Contains the router and the assets      | This folder must be publicly accessible |
| /sdk | For Software Development Kit, contains the back-end frameworks of the application      | Please add your tools here|
| /views | Contains all the adaptive views generated to the user, inspired from templating engines (Smarty/Twig/Blade) | You can set multiple layouts and views for each specfic user |
| /views/index.php | Main layout file where all the view and hooked | You can set as many as you want |
| /config.php | Configures the application before startup and includes the frameworks before the router ignition | Add the before -routing operations|

## References

Please read the Genos documentation to understand "the why" and "the how" PHP classes are implemented. [Follow the link here](http://genos.vlis-france.com/)

# Contributers

[@jocelynsafrano](https://github.com/jocelynsafrano)