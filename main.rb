require "colorize"
require 'terminal-table'
require 'mail'
require_relative 'review_mod'
require_relative 'summary_mod'
require_relative 'final_table_mod'
require_relative 'inputs_mod'


def main_method
    week_meals = {
    days: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
    meals: [],
    ingredients: [],
    }

    Inputs.inputs(week_meals)
    Summary.summary(week_meals)
    system "clear"
    Review.review_menu(week_meals)
    Final_table.final_table(week_meals)

    puts "Sending now ...".red
    puts "."
    sleep 1
    puts ".."
    sleep 1
    puts "..."
    sleep 1
    puts "Your weekly Dinner Plan has been successfuly sent!!!".red
end

main_method