# Budget App
A mobile web application where users can manage their budget.

![screenshot-mobile](ba-screenshot-mobile.png)


## Features

- The main page display a splash screen, to allow users sign in or sign up.
- The home page call *categories* display a list of all categories created by the sign in user.
- Each category card display an icon and the *total spent amount* by adding the amounts of each transaction that belongs to that category.
- User can create a new category by clicking on the green button *new category*.
- Check a category's transactions information by clicking on their card.
- Each transactions card display the date, description, and the amount corresponding to that transaction.
- User can create a new transaction by clicking on the green button *new transaction*.
- The header navigator has a *back* button. It also displays the submit button call *Next* when user open a register form like: *sign in, sign up, new category, and new transaction*

## Live demo

[Budget app demo](http://ec2-13-57-58-196.us-west-1.compute.amazonaws.com/)


## Built With

- Ruby
- Ruby on Rails
- Docker

## Getting Started


To get a local copy up and running follow these simple example steps.

### Prerequisites

- Have `git` installed on your local computer.

Without docker:
- Have `ruby` installed on your local computer.
- Have `rails` installed on your local computer.
- Have `postgresql` installed on you local computer.

With docker:
- Have `docker` and `docker-compose` on your local computer.


### Install

- Run the command `git clone git@github.com:gabyse1/budget-app.git` or `git clone https://github.com/gabyse1/budget-app.git` to clone this repository to your local computer. Choose the location you prefer.

Without docker:
- Run the command `bundle install` to install all project's dependencies.

With docker:
- To use docker: Run the command `sudo systemctl start docker` or on older distributions, you may need to use `sudo service docker start`.


### Usage

Without docker:
- Run the command `rails db:create` to create the app's database.
- Run the command `rails db:migrate` to create the app's database's tables.
- Run the command `rails s` to execute the programm.

With docker for development environment:
- Create the `.env` file by copying the `POSTGRES_USER=postgres` and `POSTGRES_PASSWORD=postgres`.
- Run the command `docker-compose build` to build the app's image.
- Run the command `docker-compose up` or to run the app as a background run `docker-compose up -d`.
- Run the command `docker exec -it web sh` to run commands inside the web app container.
- Run the command `bundle exec rake db:create` to create the database.
- Run the command `bundle exec rake db:migrate` to create the database's tables.

- Open the url `http://localhost:3000` on a browser.


## Authors

👤 **Gabriela Sánchez Espirilla**

- GitHub: [@gabyse1](https://github.com/gabyse1)
- LinkedIn: [gabyse](https://www.linkedin.com/in/gabyse/)
- Twitter: [@gse_sd](https://twitter.com/gse_sd)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).


## Show your support

Give a ⭐️ if you like this project!


## Acknowledgments

- Original design idea: [Gregoire Vella on Behance](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=)
- Linters: [Microverse](https://github.com/microverseinc/linters-config)


## 📝 License

This project is [MIT](./LICENSE) licensed.
