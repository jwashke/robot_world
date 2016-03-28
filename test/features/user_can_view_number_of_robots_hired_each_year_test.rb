require_relative '../test_helper'

class UserCanViewRobotsHiredEachYear < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_view_number_of_robots_hired_each_year
    create_robots(3)

    starting_id = get_starting_id(3)

    visit '/'

    within(".content") do
      click_link("Stats")
    end

    click_link("Hired")

    assert_equal "/stats/year", current_path

    within(".table") do
        assert page.has_content?("2016")
        assert page.has_content?("1")
    end
  end
end
