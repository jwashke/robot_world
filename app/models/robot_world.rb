class RobotWorld

  attr_reader :database,
              :robot_analysis

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.from(:robots).insert(robot)
  end

  def all
    database.from(:robots).map { |data| Robot.new(data) }
  end

  def count
    all.count
  end

  def raw_robot(id)
    database.from(:robots).where(:id => id).to_a.first
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.from(:robots).where(:id => id.to_i).update(
      :name       => robot[:name],
      :city       => robot[:city],
      :state      => robot[:state],
      :avatar     => robot[:avatar],
      :birthdate  => robot[:birthdate],
      :date_hired => robot[:date_hired],
      :department => robot[:department] )
  end

  def destroy(id)
    database.from(:robots).where(:id => id).delete
  end

  def delete_all
    database.from(:robots).delete
  end

  def robot_analysis
    robot_analysis = RobotAnalysis.new(all)
  end
end
