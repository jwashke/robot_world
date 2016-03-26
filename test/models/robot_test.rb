require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({ :name       => "name 1",
                        :city       => "city 1",
                        :state      => "state 1",
                        :avatar     => "1",
                        :birthdate  => "date 1",
                        :date_hired => "date 1",
                        :department => "department 1" })
    assert_equal "name 1", robot.name
    assert_equal "city 1", robot.city
    assert_equal "state 1", robot.state
    assert_equal "1", robot.avatar
    assert_equal "date 1", robot.birthdate
    assert_equal "date 1", robot.date_hired
    assert_equal "department 1", robot.department
  end
end
