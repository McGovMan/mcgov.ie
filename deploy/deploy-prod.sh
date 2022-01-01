#!/bin/bash

# Stop the docker container currently running the site
echo -e "\n > Shutting down mcgov.ie"
docker-compose -f docker-compose.prod.yml down

# Pull down new updates from branch main
echo -e "\n > Pulling down new updates from main"
git checkout main
git pull 

# Start the service again
echo -e "\n > Starting mcgov.ie"
docker-compose -f docker-compose.prod.yml up -d