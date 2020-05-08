class ProjectRubyTools::CLI
    
    def call
        puts "These are Ruby projects or a better used term...gems!"
        ProjectRubyTools::Scraper.scrape_ruby
        # binding.pry
        puts
        list_category
        puts
        puts "These are the coinsiding description:"
        puts
        category_description
        puts
        puts "These are the most popular projects!:"
        puts
        most_popular_projects
        puts
        puts "These are the link to all of the categories projects!:"
        puts
        other_projects_link
        # binding.pry
        menu
        puts "THIS!! WAS FUN!!"
        goodbye
    end

    def list_category
        
        puts "These are the categories:"
        # binding.pry
        ProjectRubyTools::GemCategory.all.each { |element| puts "#{element.category}"}# - #{category.price} - #{category.availability}"}
      #   @categories.each.with_index(1) do |category, i|
      #          puts "#{i}. #{category.name}"
      # end
    end

    def category_description
        ProjectRubyTools::GemCategory.all.each { |element| puts "#{element.category_description}"}
    end

    def most_popular_projects
        ProjectRubyTools::GemCategory.all.each { |element| puts "#{element.most_popular_projects}"}
    end

    def other_projects_link
        ProjectRubyTools::GemCategory.all.each { |element| puts "#{element.other_projects_link}"}
    end

    def menu
        puts "Enter the number of the category you'd like more info on or type list to see the categories again or type exit to finish:"
        input = gets.chomp
         if input == "exit"
            "exit"
         elsif input.to_i > 0 && input.to_i < 17
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].category + ": " 
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].category_description
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].most_popular_projects
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].other_projects_link
            #   binding.pry
              self.menu
            # puts "#{the_category.name}"  #{the_category.price} - "#{the_category.availability}"
            elsif input == "categories"
                list_category
                self.menu
            elsif input == "category description"
               list_category + category_description
                self.menu
            elsif input == "most popular projects"
                # binding.pry
                most_popular_projects
                self.menu
            elsif input == "other projects link"
                other_projects_link 
                self.menu
            elsif input == "projects"
                puts "these are the projects"
                self.menu
            elsif input == "help"
                puts "The proper commands are as follows: "
                puts "categories = all categories"
                puts "category description = category and description"
                puts "category description = category and description"
                self.menu
            else
                puts "HEY!!! THAT'S NOT A COMMAND!!...PLEASE input a # from 1-16, or category, or exit. THANK YOU!"
                self.menu
        end
    end

    def goodbye
        puts "Goodbye, see you later aligator!!"
    end
  

end