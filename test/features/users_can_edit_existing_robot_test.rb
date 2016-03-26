require_relative '../test_helper'

class UserEditsAnExistingRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_edit_a_robot
    robot_world.create({
      "name"       => "JoshWashke",
      "city"       => "original city",
      "state"      => "original state",
      "avatar"     => "orignal avatar",
      "birthdate"  => "original birthdate",
      "date_hired" => "original datehired",
      "department" => "original department" })

    id = get_starting_id(1) + 1

    visit "/robots/#{id}/edit"

    assert_equal "/robots/#{id}/edit", current_path

    fill_in 'robot[name]',       with: "updatedname"
    fill_in 'robot[city]',       with: "updated city"
    fill_in 'robot[state]',      with: "updated state"
    fill_in 'robot[avatar]',     with: "updated avatar"
    fill_in 'robot[birthdate]',  with: "updated birthdate"
    fill_in 'robot[date_hired]', with: "updated datehired"
    fill_in 'robot[department]', with: "updated department"

    click_button("submit")

    # assert_equal "/robots/#{id}", current_path
    #
    # assert page.has_content?("updatedname")
    # assert page.has_content?("updated city")
    # assert page.has_content?("updated state")
  end
end