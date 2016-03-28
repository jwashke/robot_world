require_relative '../test_helper'

class UserCanViewIndexOfRobots < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_view_index_of_robots
    create_robots(3)

    starting_id = get_starting_id(3)

    visit '/'

    within(".content") do
      click_link("Directory")
    end

    assert_equal "/robots", current_path

    within(".robots") do
      within("#robot-#{starting_id + 1}") do
        assert page.has_content?("name 1")
      end
      within("#robot-#{starting_id + 2}") do
        assert page.has_content?("name 2")
      end
      within("#robot-#{starting_id + 3}") do
        assert page.has_content?("name 3")
      end
    end
  end
end
