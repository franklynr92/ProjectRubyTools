
class ProjectRubyTools::GemCategory
  
attr_accessor :category, :category_description, :most_popular_projects, :other_projects_link, :project_name, :project_description 

@@all = []

    def initialize(category, category_description, most_popular_projects, other_projects_link, project_name = nil, project_description = nil) 
      @category = category
      @category_description = category_description
      @most_popular_projects = most_popular_projects
      @other_projects_link = other_projects_link
     @project_name = project_name
     @project_description = project_description
      @@all << self
    end
  
    def self.all
      @@all
    end


    
end
#this class handles all the gems
#, :project_tagline, :project_description, :project_downloads
#project_tagline, project_description, project_downloads) # projects)
=begin      @project_tagline = project_tagline
      @project_description = project_description
      @project_downloads = project_downloads
      @projects = projects
=end      #binding.pry

#def self.find_or_create_by_name(category)
   # self.all.find{|project| project == project}
   # end