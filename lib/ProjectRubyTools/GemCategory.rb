#this class handles all the gems
class ProjectRubyTools::GemCategory
  
attr_accessor :category, :category_description, :most_popular_projects, :other_projects_link, :project_name, :project_description #, :project_tagline, :project_description, :project_downloads

@@all = []

    def initialize(category, category_description, most_popular_projects, other_projects_link, project_name = nil, project_description = nil) #project_tagline, project_description, project_downloads) # projects)
      @category = category
      @category_description = category_description
      @most_popular_projects = most_popular_projects
      @other_projects_link = other_projects_link
     @project_name = project_name
     @project_description = project_description
=begin      @project_tagline = project_tagline
      @project_description = project_description
      @project_downloads = project_downloads
      @projects = projects
=end      #binding.pry
      @@all << self
    end
  
    def self.all
      @@all
    end

   #def self.find_or_create_by_name(category)
   # self.all.find{|project| project == project}
   # end

    
end