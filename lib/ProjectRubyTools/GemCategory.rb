#this class handles all the gems
class ProjectRubyTools::GemCategory
  
attr_accessor :category, :category_description, :most_popular_projects, :other_projects_link # :projects,

@@all = []

    def initialize(category, category_description, most_popular_projects, other_projects_link) # projects)
      @category = category
      @category_description = category_description
      @most_popular_projects = most_popular_projects
      @other_projects_link = other_projects_link
     # @projects = projects
      #binding.pry
      @@all << self
    end
  
    def self.all
      @@all
    end

   #def self.find_or_create_by_name(category)
   # self.all.find{|project| project == project}
   # end

    
end