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

    1. Connect inside the container

        ```bash
        docker-compose exec postgres /bin/bash
        ```

    1. Create development and test database

        ```bash
        rails db:create
        ```

    1. Init the database

        ```bash
        rails db:migrate
        ```

1. Visit http://localhost:3000
