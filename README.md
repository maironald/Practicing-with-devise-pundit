# README
Link reference: https://github.com/heartcombo/devise
Link reference: https://www.digitalocean.com/community/tutorials/how-to-set-up-user-authentication-with-devise-in-a-rails-7-application
Link reference: https://dev.to/kevinluo201/how-to-setup-very-basic-devise-in-rails-7-55ia 
Link reference: https://dev.to/kevinluo201/building-a-simple-authentication-in-rails-7-from-scratch-2dhb 

* how to set up devise:
- First: you have to run: bundle install 
- Second: you run this to add gem devise: bundle add devise 
- Third: you have to run: rails generate devise:install "or" rails g devise:install
(When you ran the devise:install command, you generated config/initializers/devise.rb, which is the initializer file for Devise. Whenever you start your Rails application, Rails will load all the gems and plugins, and then will load all the initializer files)
- Four: Open config/initializers/devise.rb for editing:
    Devise.setup do |config|
  # ...

  config.navigational_formats = ['*/*', :html, :turbo_stream]

  # ...
    end
=> This line adds turbo_stream as a navigational format. Turbo Streams are a part of Turbo, which lets you send server-rendered HTML and render pages without using much JavaScript. You need to add this for Devise 4.8.1 to work with Rails 7; otherwise, you’d get an undefined method user_url error. 

- Five: The alert and notice tags are where the messages like “Incorrect password” and such would appear in the user interface. You can always implement custom alert messages in your application (for example, if you’re using Axios interceptors with React as your frontend), but for this tutorial, you’ll complete the bare minimum Devise setup.  Open app/views/layouts/application.html.erb for editing:
<body>
  <p class="notice"><%= notice %></p> 
  <p class="alert"><%= alert %></p> 
  <%= yield %>
</body>

* Creating a User model with devise:
 - First, you have to run: rails g devise user 
+ Devise also created the user model file (app/models/user.rb), along with tests for the same. The last line of the output indicates that a route was added to the existing config/routes.rb file. Devise automatically adds all the routes like /users/sign_up and /users/sign_out using the devise_for :users helper.
 - Third: Open the migrate file: you will see Devise includes many helpful options, like fields for the password reset token and the time of sending the last token, and so on. There are also lines for features like email confirmation, locking the user out after failed login attempts, and even tracking the details of login.
 - Open the app/models/user.rb model file to review the default code:
+ A few options are added by Devise to configure how the user model works. The basic modules (database_authenticatable, registerable, recoverable, rememberable, and validatable) are already included. There are some additional options commented out, corresponding to the extra features you saw in the migration file. You can add these modules to the model file and configure the migration, depending on how much functionality you need in your application.
++ database_authenticatable: Users can authenticate themselves with a login and password field. Their encrypted password will be stored in your database.
++ registerable: Users can register themselves and can edit or delete their accounts.
++ recoverable: Users can reset their password and recover their accounts if they forget their credentials.
++ rememberable: This module remembers a user’s sessions by saving the information in a browser cookie.
++ validatable: This module provides validations for the user’s email and password fields. (For example, your application asks for the password to be at least six characters, even though you haven’t defined any custom validations in your model.)

- Go to http://localhost:3000/users/sign_up to create a account and testing.

- You can also using Flash messages:
+ Why there was text showed up on the top of the page? For example,
+ + Welcome! You have signed up successfully
+ + You are already signed in.
+ + Signed out successfully.
t
+ the code <p class="notice"><%= notice %></p>, <p class="alert"><%= alert %></p> will help you. It will show messages stored in: flash[:notice] or flash[:alert].


* how to set up pundit:
- First: you have to run: bundle install 
- Second: you run this to add gem devise: bundle add pundit
- Third: you have to run: rails generate pundit:install "or" rails g pundit:install




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
