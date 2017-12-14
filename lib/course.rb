class Course
  attr_accessor :title, :schedule, :description

  @@all = []

  def initialize
    @@all << self
  end

  def all
    @@all
  end

  def self.reset_all

  end
end
