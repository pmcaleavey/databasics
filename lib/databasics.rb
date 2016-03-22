require "active_record"
require "yaml"
require "pry"

require "databasics/version"
require "databasics/user"
require "databasics/address"
require "databasics/orders"
require "databasics/items"

db_config = YAML.load(File.open("config/database.yml"))
ActiveRecord::Base.establish_connection(db_config)

module Databasics
  class App


#Add a method to prompt for a first name, last name, and email which then creates a new user and tells the user their ID.
  def add_user
    puts "Enter your first name."
    first_name = gets.chomp

    puts "Enter your last name."
    last_name = gets.chomp

    puts "Enter your email."
    email = gets.chomp

    User.create(first_name: first_name, last_name: last_name, email: email)
  end

#Add a method to display a user's current addresses.
  def display_address

  end

#Add a method to display the items a user has ordered in the past and the number ordered.
  def items_ordered

  end

#Add a method to prompt a user for an item name and quantity and create a new order.
#If no such item can be found, you may tell them the order has been declined.
  def create_order

  end


  end
  # Your code goes here...

  ## 3 ActiveRecord querying methods
  # 1) Model.where
  # 2) Model.find
  # 3) Model.find_by
end

app = Databasics::App.new

app.add_user

binding.pry
