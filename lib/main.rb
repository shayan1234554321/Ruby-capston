require_relative './menu'

def main
  menu = Menu.new(app)

  puts '
  Welcome to Catalog of my Things app!'

  loop do
    menu.display_options

    choice = gets.chomp.to_i
    menu.perform_action(choice)
  end
end
