require_relative '../test_helper'

class UserCanViewAverageAgeOfRobots < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_view_average_age_of_robots
    create_robots(3)

    starting_id = get_starting_id(3)

    visit '/'

    within(".content") do
      click_link("Stats")
    end

    assert_equal "/stats/age", current_path

    within(".info-p") do
        assert page.has_content?("Average Robot Age:")
        assert page.has_content?("0")
    end
  end
end
