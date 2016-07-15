# _Hair Salon: Ruby Database Basics Independent Project_

### _An application for a hair salon, July 14, 2016_

### By _**Noah Yasskin**_

## Description

_An application that alows a Salon owner to view, add, update, and delete stylists and clients; it also allows an owner to add clients to a stylist_

_It uses standard naming conventions for database tables and columns._
_It correctly sets up of a one-to-many database relationship._
_It executes CRUD functionality in class methods and routes._
_It uses RESTful routes._

### The following user stories are incorporated:
* As a salon owner, I want to view, add, update and delete stylists.
* As a salon owner, I want to view, add, update and delete clients.
* As a salon owner, I want to add clients to a stylist.

* For a full description of the challenge, see [Epicodus Project guidelines:]
(https://www.learnhowtoprogram.com/ruby/ruby-database-basics/database-basics-independent-project)

## Setup/Installation Requirements

* _Download and run the source code from my GitHub repository:_

* [https://github.com/yasskin/hair-salon]

* _This is a simple open source Web application that requires a PSQL server to run_

* See the documentation at [PostgreSQL] (https://www.postgresql.org/docs/)

_Production Database: hair_salon_
_Development Database: hair_salon_test_
_Resource names (database tables) are: "clients" and "stylists"_

_In PSQL_

1. CREATE DATABASE hair_salon;
2. \c hair_salon
2. CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
3. CREATE TABLE clients (id serial PRIMARY KEY, name varchar);
4. CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

## RESTful Routing

### Behavior	Route (URL)	Method	App.rb Example	Process
Homepage	/	GET	get('/') do erb(:index) end	User requests page. The server renders the Index template back

List all stylists	/	GET	get('/') do @stylists = Stylist.all erb(:index) end	User request page. The server collects all the stylists and returns a page to display them

List all clients	/	GET	get('/') do @clients = Client.all erb(:index) end	User request page. The server collects all the clients and returns a page to display them

Show/Read a single stylist	/stylist/:id	GET	get('/stylist/:id') do @stylist = Stylist.find(params.fetch('id'),to_i) @clients = Clients.all() erb(:stylist) end	User requests to look at a single instance of a stylist. The server uses the stylist's unique id to find her or him and returns a page to display the stylist selected

New stylist form	/stylist_new	GET	get('/stylist/new') do erb(:stylist_new) end	User requests to create a new stylist. The server returns a page with a form that will let the user create a new stylist.

Create a new stylist when the form is submitted	/stylist	POST	post('/stylist') do name = params.fetch('name') @stylist = Stylist.new(name) @stylist.save() Client.find(params.fetch('client_id).to_i()) @stylist.add_client(@client) erb(:success) end	User clicks "Add Stylist" and is taken to the stylist form page to view details and add clients


## Known Bugs

_No known bugs_

## Support and contact details

_If you run into any issues or have questions, ideas or concerns - or simply want to make a contribution to the code - please contact me at noahyasskin@gmail.com._

## Technologies Used

_HTML and CSS_
_Ruby, Sinatra, and Capybara_
_PSQL_

### License

*Licensed under MIT*

Copyright (c) 2016 **_Noah Yasskin, Epicodus_**
