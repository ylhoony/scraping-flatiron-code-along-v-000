require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    doc = self.get_page
    doc.css(".post")
  end

  def make_courses
    courses = self.get_courses
    courses.each do |course|
      e = Course.new
      e.title = course.css("h2").text
      e.schedule = course.css(".date").text
      e.description = course.css("p").text
    end
  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
