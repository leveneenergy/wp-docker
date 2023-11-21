# WP
Wordpress development using docker and github

### Run

Clone the repository and run the following commands
```sh
# run the wordpress stack in background
docker compose up -d
```

visit the wordpress site on `localhost:80` and `localhost:8082` for phpmyadmin

To cleanup after installing, run the following shell command
```sh
# tear down everything
docker compose down
```
