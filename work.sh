#!/bin/bash

# open tabs for developmenting the app
gnome-terminal --tab --title="Docker" -- bash -c "cd Documents/majestic_monolith; docker-compose up; $SHELL" &
gnome-terminal --tab --title="Procfile.dev" -- bash -c "sleep 5; cd Documents/majestic_monolith; docker-compose exec majestic_monolith ./bin/dev; $SHELL" &

# lets go directory to the app
cd Documents/majestic_monolith
# start visual studio code
code .

echo "Bye bye, nice day!"
exit 0
