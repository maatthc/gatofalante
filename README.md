# How to use
* git clone https://github.com/maatthc/gatofalante.git
* bundle install --without production
* bundle update
* rails db:migrate
* rails db:seed
* rails s
* Visit http://localhost:3000

#Specification

##General Requirement:

* A user can belong to an organization. (Think of the organization feature of GitHub)

* A user and organization have points. (A user must use points to create a post)

* A user can use points from either the user account or organization account by account switching between them. (A user can belong to multiple organizations)

##Model:

###User
The user will have first name, last name, available point. Please pre-create the existing user and add initial points in database since we are skipping the user creation process on flow.

###Post
The post will have content.

###Organization
The organization will have name and available point. Please pre-create the existing organization and add initial points in database since we are skipping the user creation process on flow.

###Organization Membership
The organization membership will have user_id and organization_id. Please pre-create the organization membership in database.

##View:

###Common Top View
* There is an account switching dropdown menu.
* Display available points of the selected account.

###List View

* List all posts.
* Display empty state if no posts exist.

###New Post View
* The form should have a textarea field for content.

##Controller:

###PostsController
* This controller will have index and new actions for listing and new post form respectively.

###AccountSwitchController
* This controller will handle the account switching between the user account and organization account.