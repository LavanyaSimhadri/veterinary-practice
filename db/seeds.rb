# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email
users=[]
users << {:name => 'Bob', :email => 'bob@example.com', :password => 'test1234', :password_confirmation => 'test1234',
          :role => User.roles[:doctor], :address => "268 Elizabeth St, 10012, United States",
          :city => 'New York', :state => 'NY', :zip => 10012, :school_received_degree_from => 'American Veterinary Medical Association',
          :years_in_practice => 2 }
users << {:name => 'Susan', :email => 'susan@example.com', :password => 'test1234', :password_confirmation => 'test1234',
          :role => User.roles[:doctor], :address => "268 Elizabeth St, 10012, United States",
          :city => 'New York', :state => 'NY', :zip => 10012, :school_received_degree_from => 'American Veterinary Medical Association',
          :years_in_practice => 3 }
users << {:name => 'Lavanya', :email => 'lavanya@example.com', :password => 'test1234', :password_confirmation => 'test1234',
          :role => User.roles[:admin], :address => "268 Elizabeth St, 10012, United States",
          :city => 'New York', :state => 'NY', :zip => 10012, :school_received_degree_from => 'American Veterinary Medical Association',
          :years_in_practice => 3 }
users << {:name => 'jessica', :email => 'jessica@example.com', :password => 'test1234', :password_confirmation => 'test1234',
          :role => User.roles[:receptionist], :address => "268 Elizabeth St, 10012, United States",
          :city => 'New York', :state => 'NY', :zip => 10012, :school_received_degree_from => 'American Veterinary Medical Association',
          :years_in_practice => 1 }

users.each{|u|
  unless User.find_by(:email => u[:email]).present?
    User.create!(u)
  end
}