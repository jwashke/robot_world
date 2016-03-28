ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'tilt/erb'
require 'capybara/dsl'

Capybara.app = RobotWorldApp

module TestHelpers
  def teardown
    robot_world.delete_all
    super
  end

  def robot_world
    database = Sequel.sqlite('db/robot_world_test.sqlite')
    @robot_world ||= RobotWorld.new(database)
  end

  def create_robots(num = 2)
    num.times do |i|
      robot_world.create({ :name       => "name #{i + 1}",
                           :city       => "city #{i + 1}",
                           :state      => "state #{i + 1}",
                           :avatar     => "#{i + 1}",
                           :birthdate  => "2016-01-0#{i + 1}",
                           :date_hired => "datehired #{i + 1}",
                           :department => "department #{i + 1}" })
    end
  end

  def get_starting_id(robots_created)
    robot_world.database.from(:robots).max(:id) - robots_created
  end
end
