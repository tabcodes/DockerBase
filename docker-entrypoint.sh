#!/bin/sh

if [ ! -f .initialized ]; then                                                                                                                                                                                   
    # Install Composer dependencies
    composer install
    
    # Finished, set initialized
    touch .initialized
fi    

printf "ENTRYPOINT:\tFinishing entrypoint script...\n"

exec "$@"