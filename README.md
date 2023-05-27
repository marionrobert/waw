Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

# Development

1. Start PostgreSQL

    ```bash
    docker-compose up postgres
    ```

1. Start application

    ```bash
    docker-compose up app
    ```

1. Initialize databsae

    1. Create `.env`file

        Ask developers to send you the value

    1. Connect inside the container

        ```bash
        docker-compose exec app /bin/bash
        ```

    1. Create development and test database

        ```bash
        rails db:create
        ```

    1. Init the database

        ```bash
        rails db:migrate
        ```

    1. Run seeds

        ```bash
        rails db:seed
        ```

1. Visit http://localhost:3000

# Server installation

1. Connect on server

    ```bash
    ssh ubuntu@54.37.68.8
    ```

1. Connect as administrator

    ```bash
    sudo -i
    ```

1. Install docker

    ```bash
    apt-get update && apt-get install -y docker docker-compose postgresql-client
    ```

1. Authenticate on DockerHub

    ```bash
    docker login
    ```

    Username should be lowercase (eg. `aprevost93`)

# Deploy

On developer computer:

```bash
docker-compose build
docker-compose push
```

On the server:

```bash
ssh ubuntu@54.37.68.8
sudo -i
cd waw/
docker-compose stop app
docker-compose pull app
docker-compose up -d app
```
