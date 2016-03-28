require_relative '../test_helper'

class UserCanViewRobotsPerDepartment < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_view_number_of_robots_per_department
    create_robots(3)

    starting_id = get_starting_id(3)

    visit '/'

    within(".content") do
      click_link("Stats")
    end

    click_link("Department")

    assert_equal "/stats/department", current_path

    within(".table") do
        assert page.has_content?("department 1")
        assert page.has_content?("1")
    end
  end
end
