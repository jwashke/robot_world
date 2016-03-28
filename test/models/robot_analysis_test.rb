require_relative '../test_helper'

class RobotAnalysisTest < Minitest::Test
  include TestHelpers

  def test_it_can_return_an_array_of_robots_by_city
    create_robots(1)

    assert_equal 1, robot_analysis.robots_by(:city).count
  end

  def test_it_can_return_an_array_of_robots_by_age
    create_robots(3)

    assert_equal 3, robot_analysis.age_array.count
  end

  def test_it_can_return_the_average_age_of_robots
    create_robots(3)

    assert_equal 0, robot_analysis.average_age
  end

  def test_it_can_return_robots_hired_per_year
    create_robots(3)

    assert_equal 3, robot_analysis.robots_hired_per_year[2016]
  end

end
