class Course
  attr_accessor :title, :schedule, :description

  @@all = []

  def initialize
    @@all << self
  end

  def all
    @@all
  end

  def reset_all

  end
end
