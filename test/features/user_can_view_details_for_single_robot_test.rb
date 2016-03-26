require_relative '../test_helper'

class UserCanViewDetailsForSingleRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_view_details_of_single_robot
    create_robots(1)

    id = get_starting_id(1) + 1

    visit '/'

    click_link("Robot Index")

    assert_equal "/robots", current_path

    within("#robot-#{id}") do
      assert page.has_content?("name 1")
    end

    click_link("name 1")

    assert_equal "/robots/#{id}", current_path

    assert page.has_content?("name 1")
    assert page.has_content?("city 1")
    assert page.has_content?("state 1")
    assert page.has_content?("birthdate 1")
    assert page.has_content?("datehired 1")
    assert page.has_content?("department 1")
  end
end
