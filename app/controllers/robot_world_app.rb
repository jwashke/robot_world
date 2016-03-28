class RobotWorldApp < Sinatra::Base
  get '/' do
    @count = robot_world.count
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_world.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_world.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_world.find(id)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_world.find(id)
    erb :edit
  end

  put '/robots/:id' do |id|
    robot_world.update(id, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    robot_world.destroy(id)
    redirect '/robots'
  end

  get '/stats/age' do
    @age = robot_world.robot_analysis.average_age
    erb :age
  end

  get '/stats/year' do
    @robots_hired = robot_world.robot_analysis.robots_hired_per_year
    erb :year
  end

  get '/stats/city' do
    @robots_per_city = robot_world.robot_analysis.robots_by(:city)
    erb :city
  end

  get '/stats/state' do
    @robots_per_state = robot_world.robot_analysis.robots_by(:state)
    erb :state
  end

  get '/stats/department' do
    @robots_per_department = robot_world.robot_analysis.robots_by(:department)
    erb :department
  end

  def robot_world
    if ENV["RACK_ENV"] == "test"
      database = Sequel.sqlite('db/robot_world_test.sqlite')
    else
      database = Sequel.sqlite('db/robot_world_development.sqlite')
    end
    @robot_world ||= RobotWorld.new(database)
  end
end
