# _Hair Salon: Ruby Database Basics Independent Project_

#### _An application for a hair salon, July 14, 2016_

#### By _**Noah Yasskin**_

## Description

_An application that alows a Salon owner to view, add, update, and delete stylists and clients; it also allows an owner to add clients to a stylist_

_It uses standard naming conventions for database tables and columns.
_It correctly sets up of a one-to-many database relationship.
_It executes CRUD functionality in class methods and routes.
_It uses RESTful routes.
_For a full description of the challenge, see Epicodus Project guidelines:_
[https://www.learnhowtoprogram.com/ruby/ruby-database-basics/database-basics-independent-project]

## Setup/Installation Requirements

* _Download and run the source code from my GitHub repository:_

[https://github.com/yasskin/hair-salon]

* _This is a simple open source Web application that requires a PSQL server to run_

See the documentation at PostgreSQL [https://www.postgresql.org/docs/]

_Production Database: hair_salon
_Development Database: hair_salon_test
_Resource names (database tables) are: "clients" and "stylists"

_In PSQL_

* CREATE DATABASE hair_salon;
* CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
* CREATE TABLE clients (id serial PRIMARY KEY, name varchar);

## Known Bugs

_No known bugs_

## Support and contact details

_If you run into any issues or have questions, ideas or concerns - or simply want to make a contribution to the code - please contact me at noahyasskin@gmail.com.}_

## Technologies Used

_HTML and CSS_
_Ruby, Sinatra, and Capybara_
_PSQL_

### License

*Licensed under MIT*

Copyright (c) 2016 **_Noah Yasskin, Epicodus_**
