require 'models/robot_world'


class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

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

  get '/robots/:name' do |name|
    @robot = robot_world.find(name)
    #binding.pry
    erb :show
  end

  get '/robots/:name/edit' do |name|
    @robot = robot_world.find(name)
    erb :edit
  end

  set :method_override, true # allows us to use _method in form

  put '/robots/:name' do |name|
    robot_world.update(name, params[:robot])
    name = params[:robot][:name].gsub(" ", "%20")
    redirect "/robots/#{name}"
  end

  delete '/robots/:name' do |name|
    robot_world.delete(name)
    redirect '/robots'
  end

  def robot_world
    database = YAML::Store.new('db/robot_world')
    @robot_world ||= RobotWorld.new(database)
  end
end
