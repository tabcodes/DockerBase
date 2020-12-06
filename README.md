## PHP Docker Base

This is my base Docker image setup for PHP-based applications (specifically developed for Laravel).

## Components
- PHP7.4
- nginx
- MySQL
- ZSH
- Composer 

## Entry Point

The PHP container contains an entrypoint script that checks for a `.initialized` file for first-time installation of whatever you want to add. 
