require_relative './lib/menu'
require_relative './lib/app'

def main
  app = App.new
  menu = Menu.new(app)

  puts '
  Welcome to Catalog of my Things app!'

  loop do
    menu.display_options
    choice = gets.chomp.to_i
    abort('Bye') if choice.zero?
    menu.perform_action(choice)
  end
end

main
