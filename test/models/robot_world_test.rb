require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    create_robots(1)

    robot = robot_world.all.first

    assert_equal "name 1", robot.name
    assert_equal "city 1", robot.city
    assert_equal "state 1", robot.state
    assert_equal "1", robot.avatar
    assert_equal "date 1", robot.birthdate
    assert_equal "date 1", robot.date_hired
    assert_equal "department 1", robot.department
  end

  def test_it_returns_all_robots
    create_robots

    robots = robot_world.all

    assert_equal 2, robots.size
    assert_equal "name 1", robots[0].name
    assert_equal "name 2", robots[1].name
  end

  def test_it_can_find_a_specific_robot
    create_robots(2)

    starting_id = get_starting_id(2)

    robot = robot_world.find(starting_id + 2)

    assert_equal "name 2", robot.name
    assert_equal "city 2", robot.city
    assert_equal "state 2", robot.state
  end

  def test_it_can_update_a_robot
    create_robots(1)

    id = (get_starting_id(1) + 1)

    robot = robot_world.find(id)

    assert_equal "name 1", robot.name
    assert_equal "city 1", robot.city

    robot_world.update(id, {
      :name       => "updated name",
      :city       => "updated city",
      :state      => "updated state",
      :avatar     => "updated avatar",
      :birthdate  => "updated date",
      :date_hired => "updated date",
      :department => "updated department" })

    robot = robot_world.find(id)

    assert_equal "updated name", robot.name
    assert_equal "updated city", robot.city
    assert_equal "updated state", robot.state
    assert_equal "updated avatar", robot.avatar
    assert_equal "updated date", robot.birthdate
    assert_equal "updated date", robot.date_hired
    assert_equal "updated department", robot.department
  end

  def test_it_can_destroy_a_robot
    create_robots(1)

    robots = robot_world.all

    id = get_starting_id(1) + 1

    assert_equal 1, robots.size
    assert robots.any? { |robot| robot.id == id }

    robot_world.destroy(id)

    robots = robot_world.all

    assert robots.empty?
    refute robots.any? { |robot| robot.name == "name 1" }
  end
end
