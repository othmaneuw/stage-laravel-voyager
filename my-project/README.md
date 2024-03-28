## AOS web application
Gitlab repo for the AOS web application.
### Environment
* Laravel 9.52.15
* PHP 8.2.10
* Composer 2.6.2
* MariaDB 10.6
* Debian bullseye

## How to Install in your local environment

### Pre-requisites
This project uses Docker. You will need to install **[Docker Desktop](https://www.docker.com/products/docker-desktop/)** first.
Optionally you can install Git Bash for a nicer terminal. 

### Installation
After installing Docker Desktop, follow these steps:
* clone the repository on your machine
* open a command line window (Git Bash works too) within the cloned repo's folder (same folder as the file docker-compose.yml)
* build the project (images & containers) with the following command `docker-compose up --no-start`

## Configuration
### Database
To use the database from your Docker container change the host in **.env** to `mariadb`

## Usage
open a command line window (Git Bash works too) within the project's folder to execute any commands below.
### Start the application
To start hosting AOS on your local environment run the following command `docker-compose start` then once finished visit the link http://localhost/index.php
### Stop the application
To stop hosting AOS on your local environment run the following command `docker-compose stop`
### Restart the application
To restart AOS on your local environment run the following command `docker-compose restart`
### Debug the database
The docker container hosting your local MySQL database exposes port **3307** for direct access (through MySQL Workbench for example)

you can connect using the account `bn_myapp` (sans mot de passe)

## Development
To develop you can code directly in the project folder.
Remember to clean the cache using `php artisan config:cache` then `php artisan config:clear`
