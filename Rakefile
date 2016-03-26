require_relative 'app/models/robot_world.rb'
require 'faker'
require 'sequel'

task :default => :test

task :test do
  Dir.glob('./test/*/*_test.rb').each { |file| require file}
end

task :faker  => :create_robot_world do
  20.times do |i|
    @robot_world.create({ :name       => Faker::Name.name,
                         :city       => Faker::Address.city,
                         :state      => Faker::Address.state,
                         :avatar     => rand(1..10000),
                         :birthdate  => Faker::Date.backward(3650),
                         :date_hired => Faker::Date.backward(3650),
                         :department => Faker::Commerce.department })
  end
end

task :delete_all => :create_robot_world do
  @robot_world.delete_all
end

task :create_robot_world do
  database = Sequel.sqlite('db/robot_world.sqlite')
  @robot_world ||= RobotWorld.new(database)
end
