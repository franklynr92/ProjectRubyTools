require 'nokogiri'
require 'pry'
class ProjectRubyTools::Scraper
  #this class scrapes
  def self.scrape_ruby
    doc = Nokogiri::HTML(open("https://www.ruby-toolbox.com"))
    # based_site = "https://www.ruby-toolbox.com" orginal
    #html_to_elements = open(based_site)
    #parsed_html_elements = Nokogiri::HTML(html_to_elements)
  # binding.pry
    #scraped_elements = parsed_html_elements.css('.section.popular-categories').css('.category-card') #.css('.card-header-title')
    
    # parsed_html_elements.css('.popular-categories > .category-card > .card-header-title')
    doc.css('.section.popular-categories').css('.category-card').map do |element| #scraped_elements.map 
      category = element.css('.card-header-title').text
      category_description = element.css('.content').text
      most_popular_projects = element.css('a.project').map{|n| n.text}.join(', ').upcase
      element.css('a').attr('href').value
      other_projects_link = "https://www.ruby-toolbox.com" + element.css('a.other').attr('href').value
      #binding.pry
      open_source = ProjectRubyTools::GemCategory.new(category, category_description, most_popular_projects, other_projects_link) 
    #binding.pry
    self.scrape_gem(open_source)
    end 
  end
=begin
  def other_projects_links

    ProjectRubyTools::GemCategory.all.each.with_index(1) {|element, i| puts "#{element.other_projects_link}"}
end
=end

 def self.scrape_gem(open_source)
  doc = open(open_source.other_projects_link) 
  html_to_elements = Nokogiri::HTML(doc)

  #parsed_html_elements = Nokogiri::HTML(html_to_elements)
    # parsed_html_elements.css('div.column.projects) > div:nth-child(5) > div:nth-child(2) > div > div > div')
    project_elements = html_to_elements.css('div.project.box')
    #binding.pry
      project_elements.map do |gem|
     open_source.project_name = gem.css('h3.is-size-4 a').text.capitalize
    
    #   project_tagline = gem.css('strong.tag').first.text
    #   project_description = gem.css('.description').text
    #   project_downloads = gem.css('strong a').first.text
    #   open_source2 = ProjectRubyTools::GemCategory.new(category, category_description, most_popular_projects, other_projects_link) 
      end
end

  #category = scrape_ruby[0].css('.card-header-title').text 
  #category_description = scrape_ruby[0].css('.content').text
  #most_popular_projects =scrape_ruby[0].css('a.project').text
  #other_projects_link = based_site + scrape_ruby[0].css('a').attr('href').value
  
  
  

end