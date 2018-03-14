require "terminal-table"
require "mail"
require "colorize"
require_relative "final_table_mod"
require_relative 'send_email_mod'

module Review
    system "clear"
    def self.review_menu week_meals
        total_shopping_list = " #{week_meals[:ingredients][0]} #{week_meals[:ingredients][1]} #{week_meals[:ingredients][2]} #{week_meals[:ingredients][3]} #{week_meals[:ingredients][4]}"
        puts "Total list of ingridients are #{total_shopping_list}"
        Final_table.final_table(week_meals)
        puts "Which day would you like to review?"
        week_meals[:days].each_with_index do |day, index|
            puts "#{index + 1}. #{day}"
        end 
        puts "6. Finish and send"
        review_choice = gets.to_i
        day_index = review_choice - 1
        case review_choice 
        when 1
            system "clear"
            puts "Monday ingredients are #{week_meals[:ingredients][0]}"
            review_table(week_meals, review_choice)
            adding_extra_ingredient week_meals, day_index
            review_menu week_meals
        when 2
            system "clear"
            puts "Tuesday ingredients are #{week_meals[:ingredients][1]}"
            review_table(week_meals, review_choice)
            adding_extra_ingredient week_meals, day_index
            review_menu week_meals
        when 3
            system "clear"
            puts "Wednesday ingredients are #{week_meals[:ingredients][2]}"
            review_table(week_meals, review_choice)
            adding_extra_ingredient week_meals, day_index
            review_menu week_meals
        when 4
            system "clear"
            puts "Thursday ingredients are #{week_meals[:ingredients][3]}"
            review_table(week_meals, review_choice)
            adding_extra_ingredient week_meals, day_index
            review_menu week_meals
        when 5
            system "clear"
            puts "Friday ingredients are #{week_meals[:ingredients][4]}"
            review_table(week_meals, review_choice)
            adding_extra_ingredient week_meals, day_index
            review_menu week_meals
        when 6
            system "clear"
            Send_email.send_email(week_meals)
        else
            puts "I didn't get that"
            review_menu week_meals
        end
    end
    def self.adding_extra_ingredient week_meals, day_index
        loop do
        puts "Would you like to add anything to #{week_meals[:days][day_index]}? (y/n)"
            yes_no = gets.chomp.downcase
            if yes_no == "y"
                puts "What would you like to add? (Press #{'"n"'} to exit)"
                    extra_choice = gets.chomp.downcase
                    if extra_choice == "n" 
                        Review.review_menu(week_meals)
                    elsif
                        extra_choice_string = ", #{extra_choice}"
                        week_meals[:ingredients][day_index] << extra_choice_string
                        system "clear"
                        puts "#{week_meals[:days][day_index]} ingredients are #{week_meals[:ingredients][day_index]}"
                        review_table(week_meals, day_index)
                    end
            elsif yes_no == "n"
                system "clear"
                break
            else
                puts "I didn't get that"
                Review.review_menu(week_meals)
            end
        end
    end
    def self.review_table(week_meals, day_index)
        day_index.to_i
        rows = []
        rows << ["#{week_meals[:ingredients][day_index]}".cyan]
        review_table = 
            Terminal::Table.new :title => "#{week_meals[:days][day_index]}".colorize(:color => :white, :background => :cyan),
            :headings => ["Dish Name - #{week_meals[:meals][day_index]}".cyan],
            :rows => rows
        puts review_table
    end
end