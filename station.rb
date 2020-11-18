class Station
  
  require_relative 'instance_counter.rb'
  include InstanceCounter

  @@all_stations = []

  def self.all
    @@all_stations
  end

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations.push(self)
  end

  def take_train(train)
    @trains << train
  end
  
  def send_train(train)
    @trains.delete(train)
  end

  def trains_by_class(car_class)
    @trains.find_all { |tr| tr.class == car_class }
  end
end