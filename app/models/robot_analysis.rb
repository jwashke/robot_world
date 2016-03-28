class RobotAnalysis

  def initialize(robots)
    @robots = robots
  end

  def robots_by(key)
    info = Hash.new(0)
    @robots.each { |robot| info[robot.send(key)] += 1 }
    info
  end

  def age_array
    @robots.map { |robot| Date.today.year - Time.parse(robot.birthdate).year }
  end

  def average_age
    ages = age_array
    ages.reduce(:+) / age_array.size
  end

  def robots_hired_per_year
    info = Hash.new(0)
    @robots.each { |robot| info[Time.parse(robot.date_hired).year] += 1 }
    info
  end
end
