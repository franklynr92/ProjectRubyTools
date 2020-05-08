#this class handles all the gems
class ProjectRubyTools::GemCategory
  
attr_accessor :category, :category_description, :most_popular_projects, :other_projects_link#:projects,

@@all = []

    def initialize(category, category_description, most_popular_projects, other_projects_link)
      @category = category
      # binding.pry
      @category_description = category_description
      @most_popular_projects = most_popular_projects
      @other_projects_link = other_projects_link
      @projects = []
      @@all << self
    end
  
    def self.all
      @@all
    end

    
end