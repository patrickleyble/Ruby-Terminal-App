require "terminal-table"
require "colorize"


module Inputs
    def self.inputs(week_meals)
        which_day = 0
        week_meals[:days].each do |day|
            puts "What would you like to eat on #{day.green}?"
            meal_choice = gets.chomp
            week_meals[:meals].push meal_choice
            system "clear"
            puts "Yum!!! What do you need to buy to make #{meal_choice.green}? (Please separate your choices with a comma (#{","}))"
            ingredient_choice = gets.chomp
            week_meals[:ingredients].push ingredient_choice
            current_ingredients = week_meals[:ingredients][which_day]
            system "clear"
            create_table(current_ingredients, day, meal_choice)
            looping(current_ingredients, day, meal_choice)
            which_day += 1
            system "clear"
        end
    end
    def self.create_table(current_ingredients, day, meal_choice)
        rows = []
        rows << ["#{current_ingredients}".cyan]
        table = 
            Terminal::Table.new :title => "#{day}".colorize(:color => :green),
            :headings => ["Dish Name - #{meal_choice}".cyan],
            :rows => rows
        puts table
    end
    def self.looping(current_ingredients, day, meal_choice)
        puts "You need #{current_ingredients.green} for #{day.green} #{meal_choice.green} cook off, anything else? (y/n)"
        yes_no = gets.chomp.downcase 
        loop do
            if yes_no == "y"
                puts "What else do you need? (Press #{'"n"'} to exit)"
                extra_choice = gets.chomp.downcase
                break if extra_choice == "n"
                current_ingredients << ", #{extra_choice}"
                puts "You need #{current_ingredients.green} for #{day.green} #{meal_choice.green}cook off"
                system "clear"
                create_table(current_ingredients, day, meal_choice)
            elsif yes_no != "y" && yes_no != "n" 
                system "clear"
                    print "\t***Invalid Input!*** \n Do you need anything else (y/n)? "
                    extra_response = gets.chomp
                    if extra_response == "y" 
                        yes_no = extra_response
                    elsif extra_response == "n"
                        break
                    end
            elsif yes_no == "n"
                break
            end    
        end 
    end
 end
    