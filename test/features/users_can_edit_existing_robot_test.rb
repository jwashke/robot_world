require_relative '../test_helper'

class UserEditsAnExistingRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_edit_a_robot
    create_robots(1)

    id = get_starting_id(1) + 1

    visit '/'

    within(".content") do
      click_link("Directory")
    end
    
    assert_equal "/robots", current_path

    click_button("edit")

    assert_equal "/robots/#{id}/edit", current_path

    fill_in 'robot[name]',       with: "updated name"
    fill_in 'robot[city]',       with: "updated city"
    fill_in 'robot[state]',      with: "updated state"
    fill_in 'robot[avatar]',     with: "updated avatar"
    fill_in 'robot[birthdate]',  with: "updated birthdate"
    fill_in 'robot[date_hired]', with: "updated datehired"
    fill_in 'robot[department]', with: "updated department"

    click_button("Edit Robot")

    assert_equal "/robots/#{id}", current_path

    assert page.has_content?("updated name")
    assert page.has_content?("updated city")
    assert page.has_content?("updated state")
    assert page.has_content?("updated birthdate")
    assert page.has_content?("updated datehired")
    assert page.has_content?("updated department")
  end
end
