require "tty-prompt"
class ProjectRubyTools::CLI
    attr_accessor :username

    def call
        greet
        get_user_name
        #ProjectRubyTools::Scraper.scrape_ruby
        # binding.pry
       # display
    end

    def greet
        puts "Hello there!"
        sleep(1)
        puts "This is a one stop shop for Ruby projects or a better used term...gems!"
        sleep(3)
        puts "Please press enter to continue or.."
        puts "...type exit to leave"
        input = gets.chomp
        if input == "exit"
        puts "Awh okay"
           goodbye
        end
    end  

    def get_user_name
        puts "Glad you can stay!"
        puts "What is your name friend?"
        name = gets.chomp
        self.username = name
        puts "Welcome, #{self.username}"
        sleep(2)
        scrape1
    end


    def scrape1
        sleep(1)
        ProjectRubyTools::Scraper.scrape_ruby
        system("clear")
        sleep(1)
        display
    end

=begin       
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
        puts
        puts "These are the projects under each category"
        #projects_link
        #ProjectRubyTools::Scraper.scrape_gems(categorygem)
        menu
        puts "THIS!! WAS FUN!!"
        goodbye
    end
=end

    def display
        puts "#{self.username}"
        puts "These are the categories: "
    ProjectRubyTools::GemCategory.all {|element| puts "#{element.category} :,#{element.category_description}, #{element.most_popular_projects}"}
    menu
    end

    def options
        puts "put the number type"
        input = gets.strip
        if input.to_i <= ProjectRubyTools::GemCategory.size
            element = ProjectRubyTools::GemCategory.all[input.to_i-1]
           puts ProjectRubyTools::GemCategory.display_second_scrape
        else 
            goodbye
        end

    end
=begin
    def display_second_scrape()
    end
=end
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

    #build CLI better whehter they want to know projects or details

 

    def menu # gemcategories allow user to select gem category
        puts "Enter the number of the category you'd like more info on, type list to see the categories again, type help for help or type exit to finish:"
        input = gets.chomp
         if input == "exit"
            goodbye
         elsif input.to_i > 0 && input.to_i < 17
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].category + ": " 
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].category_description
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].most_popular_projects
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].other_projects_link
            # puts "do you want to see more"
        #  elsif input == "yes"
            self.menu
            #scrape2s
            #find instance of that category
            #pass that instance to second scraper
            #details method prints details for gem category
            # method for each input
            # puts ProjectRubyTools::GemCategory.all[input.to_i-1].projects
            #   binding.pry
            # puts "#{the_category.name}"  #{the_category.price} - "#{the_category.availability}"
            elsif input == "list"
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
                #use each with index for second scrape?
                #scrape2 once category is chosen to dive in 1st category
                #find by and pass on to second scraper    
            #elsif input == "projects"
             #   projects_link_name
              #  self.menu
            elsif input == "help"
                puts "The proper commands are as follows: "
                puts "categories = all categories"
                puts "most popular projects = most popular projects"
                puts "other projects link = other projects link"
                self.menu
            else
                puts "HEY!!! THAT'S NOT A COMMAND!!...PLEASE input a # from 1-16, help for help, or exit to finish. THANK YOU!"
                self.menu
    end
    end

    def goodbye
        puts "Goodbye, see you later aligator!!"
        puts "Hello world!" 
        sleep(2)
        abort("She cannot take any more of this, Captain!")
    end
  

end