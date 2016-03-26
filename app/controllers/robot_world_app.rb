class RobotWorldApp < Sinatra::Base
  get '/' do
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

  def robot_world
    if ENV["RACK_ENV"] == "test"
      database = Sequel.sqlite('db/robot_world_test.sqlite')
    else
      database = Sequel.sqlite('db/robot_world.sqlite')
    end
    @robot_world ||= RobotWorld.new(database)
  end
end
