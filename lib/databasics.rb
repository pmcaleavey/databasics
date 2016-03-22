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

    user = User.create(first_name: first_name, last_name: last_name, email: email)
    #user_id = User.user_id
    puts "Your user id is #{user.id}."
    puts
  end

#Add a method to display a user's current addresses.
  def display_address
    puts "To get an address, enter a first and last name"
    puts "What is the first name"
    first_name = gets.chomp

    puts "What is the last name"
    last_name = gets.chomp

    user = User.where(first_name: first_name, last_name: last_name)

    address = Address.where(user_id: user.id)

    puts "#{address.street}"

    # addresses.each do |x|
    #   puts "x.#{street}"
    #   # puts x.city
    #   # puts x.state
    #   # puts x.zip
    # end

    # addresses.each do |x|
    #   street = x["street"]
    #   city = x["city"]
    #   state = x["state"]
    #   zip = x["zip"]
    #   binding.pry
    # end

    # clients.each do |client|
    #   puts client.address.postcode
    # end

  end

#Add a method to display the items a user has ordered in the past and the number ordered.
  def order_history
    puts "Enter the first and last name of the person you like to know the order history for?"
    puts "What is the first name"
    first_name = gets.chomp

    puts "What is the last name"
    last_name = gets.chomp

    user = User.find_by(first_name: first_name, last_name: last_name)
    binding.pry




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

#app.add_user
#app.display_address
app.order_history

binding.pry
