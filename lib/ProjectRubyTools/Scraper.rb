require 'nokogiri'
require 'pry'
class ProjectRubyTools::Scraper
  #this class scrapes
  def self.scrape_ruby
    based_site = "https://www.ruby-toolbox.com" 
    html_to_elements = open(based_site)
    parsed_html_elements = Nokogiri::HTML(html_to_elements)
    scraped_elements = parsed_html_elements.css('.section.popular-categories').css('.category-card')
    scraped_elements.map do |element|
      category = element.css('.card-header-title').text
      category_description = element.css('.content').text
      most_popular_projects = element.css('a.project').map{|n| n.text}.join(', ').upcase
      other_projects_link = based_site + element.css('a').attr('href').to_s
      open_source = ProjectRubyTools::GemCategory.new(category, category_description, most_popular_projects, other_projects_link) 
    end
    # binding.pry
  end

  def self.scrape_gems(categorygem)
    binding.pry
    other_projects_link = categorygem
    html_to_elements = open(categorygem)
    parsed_html_elements = Nokogiri::HTML(html_to_elements)
  # binding.pry
    project_elements = parsed_html_elements.css('.project.box')
  # binding.pry
  end
  #   project_elements.each do |gem|
  #     projects = gem.css('h3').css('a').text.capitalize
    
  #   end
  # end

  #category = scrape_ruby[0].css('.card-header-title').text 
  #category_description = scrape_ruby[0].css('.content').text
  #most_popular_projects =scrape_ruby[0].css('a.project').text
  #other_projects_link = based_site + scrape_ruby[0].css('a').attr('href').value
  
  
  

end