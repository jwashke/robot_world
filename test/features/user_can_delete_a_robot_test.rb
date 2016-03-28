require_relative '../test_helper'

class UserDeletesARobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_delete_a_robot
    create_robots(1)

    id = get_starting_id(1) + 1

    visit '/'
    within(".content") do
      click_link("Directory")
    end

    assert_equal "/robots", current_path
    within("#robot-#{id}") do
      assert page.has_content?("name 1")
    end

    click_button("delete")

    assert_equal "/robots", current_path
    refute page.has_content?("name 1")
  end
end
