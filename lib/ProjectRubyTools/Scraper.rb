require 'nokogiri'
require 'pry'
class ProjectRubyTools::Scraper
  
  def self.scrape_rubytools
    doc = Nokogiri::HTML(open("https://www.ruby-toolbox.com"))
    
    doc.css('.section.popular-categories').css('.category-card').map do |element| 
      category = element.css('.card-header-title').text
      category_description = element.css('.content').text
      most_popular_projects = element.css('a.project').map{|n| n.text}.join(', ').upcase
      element.css('a').attr('href').value
      other_projects_link = "https://www.ruby-toolbox.com" + element.css('a.other').attr('href').value
      open_source = ProjectRubyTools::GemCategory.new(category, category_description, most_popular_projects, other_projects_link) 
    self.scrape_gem(open_source)
    end 
  end

 def self.scrape_gem(open_source)
  doc = open(open_source.other_projects_link) 
  html_to_elements = Nokogiri::HTML(doc)


    project_elements = html_to_elements.css('div.project.box')
    
      project_elements.map do |gem|
     open_source.project_name = gem.css('h3.is-size-4').css('a').text.capitalize
     open_source.project_description = gem.css('.description').first.text
    
      end
end

end

#this class scrapes
#scraped_elements.map 
# based_site = "https://www.ruby-toolbox.com" orginal
    #html_to_elements = open(based_site)
    #parsed_html_elements = Nokogiri::HTML(html_to_elements)
  # binding.pry
    #scraped_elements = parsed_html_elements.css('.section.popular-categories').css('.category-card') #.css('.card-header-title')
    
    # parsed_html_elements.css('.popular-categories > .category-card > .card-header-title')
    #   project_tagline = gem.css('strong.tag').first.text
    #   project_description = gem.css('.description').text
    #   project_downloads = gem.css('strong a').first.text
    #   open_source2 = ProjectRubyTools::GemCategory.new(category, category_description, most_popular_projects, other_projects_link) 


  #category = scrape_ruby[0].css('.card-header-title').text 
  #category_description = scrape_ruby[0].css('.content').text
  #most_popular_projects =scrape_ruby[0].css('a.project').text
  #other_projects_link = based_site + scrape_ruby[0].css('a').attr('href').value
  
  
  
  #parsed_html_elements = Nokogiri::HTML(html_to_elements)
    # parsed_html_elements.css('div.column.projects) > div:nth-child(5) > div:nth-child(2) > div > div > div')