require_relative '../test_helper'

class UserCanViewRobotsPerState < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_view_number_of_robots_per_state
    create_robots(3)

    starting_id = get_starting_id(3)

    visit '/'

    within(".content") do
      click_link("Stats")
    end

    assert_equal '/stats/age', current_path

    click_link("State")

    assert_equal "/stats/state", current_path

    within(".table") do
        assert page.has_content?("state 1")
        assert page.has_content?("1")
    end
  end
end
