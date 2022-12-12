# Voyager

Voyager is an online shoes shopping site, products from big brands like Nike, Adidas, New Balance, ... You can be both a customer and a shop owner in this very website.

## Installation

1. You should install and know to use Docker
2. Clone the repo
    ```sh
    git clone https://github.com/Trunkg0d/Hopee-shopping-cart.git
    ```
3. Run docker
    - Note that the project uses ruby 3.1.2 and postgres 14.5, you should to check it in Dockerfile and docker-compose.yml
    - Run the following command
        ```sh
        docker compose up --build
        ```
4. Create database if database is not present
    - Use another terminal, cd to the root of the project and do the command below
        ```sh
        docker compose run web bash
        ```
    - Then
        ```sh
        rails db:create db:migrate db:seed
        ```
5. Finally, you can view and use the website via http://localhost:3000/
## Usage
To log in and use the web, you can use the account below
- Account name: example@railstutorial.org
- Password: foobar
- You can also create the new account, but it requires account confirmation through email and I use mailtrap for this project, so I can not check your email often
## Contributing

This is my internship project, working alone for more than 2 weeks. All of the project I use Ruby on Rails for Backend; HTML, CSS, Bootstrap for Frontend and also use Docker to setup project.
