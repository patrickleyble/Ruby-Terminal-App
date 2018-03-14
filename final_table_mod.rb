require "colorize"
require "terminal-table"

module Final_table
    def self.final_table weekly_planner
        rows = []
        rows << [
                "Dish Name: #{weekly_planner[:meals][0]}".light_blue,
                "Dish Name: #{weekly_planner[:meals][1]}".light_magenta,
                "Dish Name: #{weekly_planner[:meals][2]}".light_green,
                "Dish Name: #{weekly_planner[:meals][3]}".light_yellow,
                "Dish Name: #{weekly_planner[:meals][4]}".light_cyan
            ]
        
        rows << :separator
        
        rows << [
            "#{weekly_planner[:ingredients][0]}".light_blue,
            "#{weekly_planner[:ingredients][1]}".light_magenta,
            "#{weekly_planner[:ingredients][2]}".light_green, 
            "#{weekly_planner[:ingredients][3]}".light_yellow, 
            "#{weekly_planner[:ingredients][4]}".light_cyan
             ]
        
        
        final_table = 
            Terminal::Table.new :title => " Weekly Dinner Planner ".colorize(:color => :white, :background => :red),
            :headings => [
                "Monday".blue,
                "Tuesday".magenta, 
                "Wednesday".green, 
                "Thursday".yellow, 
                "Friday".cyan
                ],
            :rows => rows
            puts final_table
    end
end