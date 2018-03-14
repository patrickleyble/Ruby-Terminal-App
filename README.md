## __DINNER PLANNER__
### __DESCRIPTION__
Dinner planner is a ruby application that allows you to plan your dinners a week ahead , as well as is able to extract your total shopping list to assist you doing groeceries. 
The Dinner plan and the shopping list is emailed to the user for future use.
Requires 'terminal-table' and 'colorize' and 'mail' gems. 
The result will be presented in in terminal tables using terminal-table gem. 
Before you finish you are able to review your choices as well as add additional ingridients to particular days, which will then add to the total list of ingredients. 
In the end, you send the total listing to your own email which is your ready plan and shopping list always handy at a touch of your email:)
### __GEMS__
- **Terminal Table Gem** is a fast and simple, yet feature rich ASCII table generator written in Ruby.
- **Colorize Gem** extends String class or add a ColorizedString with methods to set text color, background color and text effects.
- **Mail Gem** is an internet library for Ruby that is designed to handle emails generation, parsing and sending in a simple, rubyesque manner.
### __INSTALLATION AND USAGE__
- Requirements 
    - ruby
    - bash
    - homebrew
In order to install the requirements please make sure you have Bundler (https://bundler.io/). Simple Bundler installation:
```
$ gem install bundler
```
Once bundler is installed, please run in your terminal: 
```
$ bundle install
```
Once that has finished succesfully installing all the gems just run the main file
```ruby
$ ruby main.rb
```
Simply answer the prompts. 
After your initial answer consisting of name of the meal, the app will ask you for the ingredients you need to buy to be able to cook that particular meal. 
The meal name will be stored under the particular weekday and the ingredients will be assigned to the particular meal. 
In the end during the final dinner meal plan review you are able to add extra ingridients in case you forgot to add these at the time.
### __STRUCTURE__ 
#### __Modules and methods__
- Input_mod 
    
    Methods:
    - inputs 
    - create_table
- Final_table 
    Method:
    - final_table
- Review
    Methods:
    - review_menu
    - adding_extra_ingredient
    - review_table
- Send_email
    Method:
    - send_email
### __CHALLENGES__
Due to the fact that this is our very first application we had initial difficulty at the planning stage. We found it hard to define and limit the scope of functionalities that we could implement in the given amount of time. 
Originally our limited knowledge about implementing modules and methods made our code unclear, "neverending" and hard to read. We have managed to "clean it up" to a readable point and hopefully any other programmer can access the data easily. 
### __CURRENT ISSUES__ 
- if the table is wider than screen size/terminal size, the table will be disturbed and may not view properly. 
When that happens, the user needs to change the size of the font used in the terminal or widen their screen if possible.
### __UPCOMING IMPROVEMENTS__
- being able to reverse from the "Send" screen
- delete elements from individual days review
- replace simple text format with nice, user friendly HTML emails
- introduce quantity functionality so the final shopping list can come up with the number/amount of ingredients you need to buy
- automatically adjust the screen width (adding too many ingredients will throw the final table off)
- In the future, after sending the content to user's email, the application will return to the review menu, from which the user wills till be able to add ingredients or simply exit the application
- Add additional meals per day like breakfast and lunch
### __Authors__ 
John Patrick Leyble and Eryk Grasela