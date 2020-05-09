require "tty-prompt"
class ProjectRubyTools::CLI
    attr_accessor :username #, :gemprojects

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
        sleep(2)
        puts "Please press enter to continue .."
        puts "...type exit to leave or exit! for a quick haste"
        input = gets.chomp
        if input == "exit"
        puts "Awh okay"
           quickExit
        elsif input =="exit!"
            goodbye
        end
    end  

    def get_user_name
        puts "Glad you can stay!"
        puts "What is your name friend?"
        name = gets.chomp
        self.username = name
       if name == "exit"
            quickExit
        elsif name == "" 
            self.username = "Captain"
        puts "Welcome, #{self.username}"
        sleep(2)
        scrape1
        else
        puts "Welcome, #{self.username}"
       sleep(2)
        scrape1
    end
end


    def scrape1
        puts "#{self.username}, if you could please wait a moment"  
        sleep(0.5)
        puts "We'll be right with you shortly"
        sleep(0.3)
        puts "Thank you!"
        sleep(1)
        ProjectRubyTools::Scraper.scrape_ruby
        #ProjectRubyTools::Scraper.scrape_gem
        puts "Get ready to... Yo-ho-ho!"
        sleep(1)
        system("clear")
        sleep(1)
        display
    end

    def display
        puts "#{self.username}"
        puts "These are the categories: "
        ProjectRubyTools::GemCategory.all.each.with_index(1) {|element, i| puts "For #{i}. the category is... #{element.category} 
        a brief description of  what #{element.category} does is the following:
        #{element.category_description}, 
         two most popular projects are: 
        #{element.most_popular_projects}"}
        menu
    end
=begin
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


    def projects_scrape
    ProjectRubyTools::Scraper.scrape_gems
    projects
    end
=end

    def list_category
        puts "These are the categories:"
        # binding.pry
        ProjectRubyTools::GemCategory.all.each.with_index(1) { |element,i| puts "#{i}. #{element.category}"}
        #ProjectRubyTools::GemProjects.all.each.with_index(1) { |element,i| puts "#{i}. #{element.category}"}
        menu
    end

    def category_gems
        ProjectRubyTools::GemCategory.all.each.with_index(1) { |element,i| puts "#{i}. #{element.category}"}
    end

    def category_description
        puts "These are all the categories with the coninsiding descriptions"
        sleep(1)
        ProjectRubyTools::GemCategory.all.each.with_index(1) {|element, i| puts "#{i}. #{element.category}: 
        Description:
        #{element.category_description}"}
         menu
    end

    def most_popular_projects
        puts "These are the all the categories with their two most popular projects:"
        sleep(1.5)
        ProjectRubyTools::GemCategory.all.each.with_index(1) {|element, i| puts "#{i}. #{element.category}:
        The most popular projects are as follows:
        #{element.most_popular_projects}"}
        menu
    end

    def other_projects_link 
        puts "These are the all the categories with their links:"
        sleep(1.5)
        ProjectRubyTools::GemCategory.all.each.with_index(1) {|element, i| puts "#{i}. #{element.category}:
        
        #{element.other_projects_link }"}
        menu
    end

    def project
        ProjectRubyTools::GemCategory.all.each.with_index(1) {|element, i| puts "#{i}. #{element.project_name}"}
        menu
    end
#        @gemcategory.each do |gemcategory|
 #           ProjectRubyTools::Scraper

=begin    def projects
        ProjectRubyTools::GemCategory.all.each { |element| puts "#{element.other_projects_link}"}
    end
=end
    #build CLI better whehter they want to know projects or details

 

    def menu # gemcategories allow user to select gem category
        puts "Enter a number of the category you'd like more info on from 1-16."
        puts "The other commands are as follows: "
                puts "list = only the categories"
                puts "category description or cat d = categories with a description"
                puts "most popular projects or mop proj = categories with their most popular projects"
                puts "other projects link = other projects link"
                puts "exit"
        puts "type help for help or type exit to finish:"
        input = gets.chomp
         if input == "exit"
            goodbye
         elsif input.to_i > 0 && input.to_i < 17
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].category + ": " 
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].category_description
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].most_popular_projects
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].other_projects_link
            self.menu
            #scrape2s
            #find instance of that category
            #pass that instance to second scraper
            #details method prints details for gem category
            # method for each input
            # puts ProjectRubyTools::GemCategory.all[input.to_i-1].projects
            # puts "#{the_category.name}"  #{the_category.price} - "#{the_category.availability}"
            elsif input == "list"
                list_category
                self.menu
            elsif input == "category description" || input == "cat description"
               category_description
                self.menu
            elsif input == "most popular projects" || input == "mop proj"
                # binding.pry
                most_popular_projects
                self.menu
            elsif input == "other projects link"
                other_projects_link 
                self.menu
            elsif input == "projects"
                project
              self.menu
            elsif input == "help"
                puts "You need some help?"
                sleep(1)
                system("clear")
                sleep(1)
                puts "The commands are as follows: "
                puts "Enter a number of the category you'd like more info on from 1-16."
                        puts "list = only the categories"
                        puts "category description or cat d = categories with a description"
                        puts "most popular projects or mop proj = categories with their most popular projects"
                        puts "other projects link = other projects link"
                        puts "exit"
                puts "type help for help or type exit to finish:"
                self.menu
            else
                puts "HEY!!! THAT'S NOT A COMMAND!!...PLEASE input a # from 1-16, help for full command list, or exit to finish. THANK YOU!"
                self.menu
    end
    end

    def quickExit
        puts "So soon?!"
        puts "Press enter to contiue...exit to leave, Cap'n for a Captain's farewell, goodbye for a farewell song"
        input = gets.chomp
        if input == "exit"
            puts "at last matey"
            puts "We must part ways"
            sleep(1.5)
            abort("Life's uncharted Journerys")
        elsif input == "Cap'n"
            goodbye
        elsif input == "goodbye"
            puts "so long.. " 
            sleep(1.2) 
            puts "farewell" 
            sleep(2.0)
            puts "to you" 
            sleep(2.0)
            puts "my friends" 
            sleep(4.0)
            puts "Goodbye" 
            sleep(2.0) 
            puts "for now," 
            puts "until we meet again"
            sleep(2.0)
               abort("It's been fun!")
        else
            get_user_name
        end
    end

=begin    def first_note(a,b,c,d,e,f,g)
        a = "so long..."
        b = "farewell"
        c = "to you"
        d = "my friends"
        e = "Goodbye"
        f = "for now"
        g = "until we meet again"
    end
=end
    

    def goodbye
        system("clear")
        puts "Goodbye, see you later aligator!!"
        puts "She cannot take any more of this, Captain!" 
        sleep(2)
        puts"Goodbye..
        until we sea shall each other again!
            Fair Winds and Following Seas."
        sleep(3)
        abort()
    end
  

end