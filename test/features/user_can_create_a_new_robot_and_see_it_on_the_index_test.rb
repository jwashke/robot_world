require_relative '../test_helper'

class UserCreatesANewRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_create_a_robot
    visit '/'

    click_link("New Robot")

    assert_equal "/robots/new", current_path

    fill_in 'robot[name]', with: "Josh Washke"
    fill_in 'robot[city]', with: "Littleton"
    fill_in 'robot[state]', with: "CO"
    fill_in 'robot[avatar]', with: "123"
    fill_in 'robot[birthdate]', with: "11-18-1989"
    fill_in 'robot[date_hired]', with: "02-01-2016"
    fill_in 'robot[department]', with: "engineering"

    click_button("create robot")

    id = get_starting_id(1) + 1

    assert_equal "/robots", current_path

    within(".robot-#{id}") do
      assert page.has_content?("Josh Washke")
    end
  end
end
