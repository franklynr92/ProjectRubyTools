require "tty-prompt"
class ProjectRubyTools::CLI
    attr_accessor :username

    def call
        system("clear")
        greet
        get_user_name
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
        puts "Patience is a virtue"
        puts "Thank you!"
        ProjectRubyTools::Scraper.scrape_rubytools
        puts "Get ready to... Yo-ho-ho!"
        sleep(1.5)
        system("clear")
        sleep(1)
        display
    end

    def display
        puts "#{self.username}"
        puts "These are the categories: "
        sleep(1)
        ProjectRubyTools::GemCategory.all.each.with_index(1) {|element, i| puts "For #{i}. the category is... #{element.category} 
        a brief description of  what #{element.category} does is the following:
        #{element.category_description}, 
         two most popular projects are: 
        #{element.most_popular_projects}"}
        menu
    end

    def clear
        system('clear')
        menu
    end

    def list_category
        puts "These are the categories:"
        sleep(1)
        ProjectRubyTools::GemCategory.all.each.with_index(1) { |element,i| puts "#{i}. #{element.category}"}
        puts "Would you like to see projects"
        puts "Type ' not so pop ' for low projects, ' popular ' for popular projects, ' menu ' for menu, ' clear ' to clear and go to menu and ' exit ' for exit"
        input = gets.chomp
         if input == "not so pop"
            not_so_popular_projects
         elsif input == "popular"
            popular_projects_view
         elsif input == "exit"
            goodbye
        elsif input == "clear"
                clear
         elsif input == "menu"
            menu
         end
    end
    
    def popular_projects_view
            puts "Enter a number from 1 - 16"
            puts "You shall see a project from coinciding category including a link to the category to see more"
            puts "type ' high ' to see just the project with the two highest project scores from each category"
            puts " ' menu ' for menu"
            puts " 'exit' to exit"
            input = gets.chomp
            if input == "menu"
                system("clear")
                sleep(0.5)
                menu
             elsif input.to_i > 0 && input.to_i < 17
                system("clear")
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].category + ": "
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].most_popular_projects
            puts "A link to this category's projects"    
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].other_projects_link
            self.popular_projects_view
             elsif input == "high"
            ProjectRubyTools::GemCategory.all.each.with_index(1) {|element, i| puts "#{i}. #{element.most_popular_projects}"}
            self.popular_projects_view
            elsif input == "exit"
                goodbye
            else
            self.popular_projects_view
            end
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

    def not_so_popular_projects
        puts "Enter a number from 1 - 16"
        puts "You shall see a project from coinciding category including a link to the category to see more and a description if there is one available"
        puts "type 'low' to see project with lowest project score from each category"
        puts "'menu' for menu"
        puts "'exit' for exit"
        input = gets.chomp
    if input == "menu"
            menu
        elsif input.to_i > 0 && input.to_i < 17
            system("clear")
        puts ProjectRubyTools::GemCategory.all[input.to_i-1].category + ": "
        puts ProjectRubyTools::GemCategory.all[input.to_i-1].project_name
        puts "Description:"
        puts ProjectRubyTools::GemCategory.all[input.to_i-1].project_description
        puts " " 
        puts ProjectRubyTools::GemCategory.all[input.to_i-1].other_projects_link
        self.not_so_popular_projects
        elsif input == "low"
            system("clear")
        ProjectRubyTools::GemCategory.all.each.with_index(1) {|element, i| puts "#{i}. #{element.project_name}"}
        self.not_so_popular_projects
        elsif input == "exit"
            goodbye
        end
    end

    def menu # gemcategories allow user to select gem category
        puts "Either enter a number of the category you'd like more info on from 1-16, or use one of these commnands:"
                        puts " ' list ' = all categories and display other commands, 'category description' or 'cat d' = all categories with a description"
                        puts " ' most popular projects ' or ' mop proj ' = Categories with their most popular projects"
                        puts " ' link ' = Category with a link to it's available projects"
                        puts " ' not so pop ' = Information on not so popular projects available for use"
                        puts "exit"
        puts "type 'help' for help or type 'exit' to finish:"
        input = gets.chomp
        if input == "exit"
            goodbye
         elsif input.to_i > 0 && input.to_i < 17
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].category + ": " 
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].category_description
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].most_popular_projects
            puts ProjectRubyTools::GemCategory.all[input.to_i-1].other_projects_link
            #puts ProjectRubyTools::GemCategory.all[input.to_i-1].project_name
            self.menu
            elsif input == "list"
                system("clear")
                list_category
                self.menu
            elsif input == "category description" || input == "cat d"
                system("clear")
               category_description
                self.menu
            elsif input == "most popular projects" || input == "mop proj"
                system("clear")
                most_popular_projects
                self.menu
            elsif input == "link"
                other_projects_link 
                self.menu
            elsif input == "not so pop"
                system("clear")
                not_so_popular_projects
              self.menu
            elsif input == "clear"
                system("clear")
                self.menu
            elsif input == "help"
                puts "You need some help?"
                sleep(1.56)
                system("clear")
                sleep(1)
                puts "The commands are"
                system("clear")
                puts "Either enter a number of the category you'd like more info on from 1-16, or use one of these commnands:"
                    puts " 'list' = all categories, 'category description' or ' cat d ' = all categories with a description"
                    puts " 'most popular projects' or 'mop proj' = categories with their most popular projects"
                    puts " 'other projects link' = other projects link"
                    puts " 'not so pop' = low scoring projects available for use"
                    puts " 'clear' to clear terminal"
                    puts " ' exit'  to exit, or ' help ' for help"
                self.menu
            else
                system("clear")
                puts "HEY!!! THAT'S NOT A COMMAND!!...PLEASE input a # from 1-16, ' help ' for full command list, or ' exit ' to finish. THANK YOU!"
                self.menu
    end
    end

    def quickExit
        puts "So soon?!"
        puts "Press enter to contiue...' exit ' to leave, ' Cap'n ' for a Captain's farewell, ' goodbye ' for a farewell song/poem"
        input = gets.chomp
        if input == "exit"
            system("clear")
            puts "Awh okay"
            system("clear")
            sleep(1.0)
            puts "at last matey"
            sleep(1.5)
            puts "We must part ways"
            sleep(1.5)
            abort("Life's uncharted Journerys")
        elsif input == "Cap'n"
            puts "You picked a Captain's farewell"
            sleep(1)
            puts "Good choice!"
            system("clear")
            goodbye
        elsif input == "goodbye"
            puts "You picked a farewell song/poem"
            puts "good choice"
            system("clear")
            puts "you can sing along if you like"
            sleep(1.2)
            system("clear")
            puts "so long.. " 
            sleep(1.2) 
            puts "farewell" 
            sleep(1.5)
            puts "to you" 
            sleep(1.5)
            puts "my friends" 
            sleep(2.5)
            puts "Goodbye" 
            sleep(2.0) 
            puts "for now,"
            sleep(1.0) 
            puts "until we meet again"
            sleep(2.1)
               abort("It's been fun!")
        else
            get_user_name
        end
    end
    

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