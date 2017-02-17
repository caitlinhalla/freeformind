# _FreeForMind Jewelry Store_

#### By _**Caitlin Ashtari**, 2/17/2017_

## Description

This project is a redesign of Free For Mind's website. The company needed a new site with basic user and administrator accounts. Basic users are allowed to view all products and details, leave reviews on products, and edit reviews that they own. Only administrators have the ability to add, edit, or delete products, along with the ability to delete users and reviews.

## Prerequisites

You will need the following things properly installed on your computer.

* Ruby
* Rails
* Postgres

## Installation

* `git clone https://github.com/caitlinashtari/freeformind`
* `cd freeformind`
* `bundle`
* `rails db:create`
* `rails db:migrate db:test:prepare`

## Setup Admin Account

In order to view the admin path/dashboard, an admin must be created in the database with the admin attribute set to "true":

* `rails console`
* `admin = User.new(email: "franz@test.com", password: "password", password_confirmation: "password", admin: true)`
* `admin.save`

Now, simply log in on the site with these admin user credentials.

To view the basic user account, visit the site to sign up.

## Running

* `rails serve`
* Visit your app at [http://localhost:3000](http://localhost:3000).

## Technologies Used

_Rails, Ruby, ActiveRecord, Postgres, Devise, RailsAdmin, Paperclip, MaterializeCSS _

### License

*MIT License*

Copyright (c) 2017 **_Caitlin Ashtari_**
