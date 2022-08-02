#!/bin/bash

# open tabs for developmenting the app
gnome-terminal --tab --title="Docker" --command="bash -c 'cd Documents/majestic_monolith; docker-compose up; $SHELL'" &
gnome-terminal --tab --title="Yarn CSS" --command="bash -c 'sleep 5; cd Documents/majestic_monolith; docker-compose exec majestic_monolith yarn build:css --watch; $SHELL'" &
gnome-terminal --tab --title="Yarn JS" --command="bash -c 'sleep 5; cd Documents/majestic_monolith; docker-compose exec majestic_monolith yarn build --watch; $SHELL'" &

# lets go directory to the app
cd Documents/majestic_monolith
# start visual studio code
code .
# bye bye, nice day!
echo "Bye bye, nice day!"
exit 0
