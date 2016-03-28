require 'sequel'

["development", "test"].each do |env|
  Sequel.sqlite("db/robot_world_#{env}.sqlite").create_table :robots do
    primary_key :id
    String      :name
    String      :city
    String      :state
    String      :avatar
    String      :birthdate
    String      :date_hired
    String      :department
  end
end
