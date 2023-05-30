class Menu
  def initialize(app)
    @app = app
  end

  def display_options
    puts "
    Display:
      1 - List all books
      0 - Exit
    "
  end

  def perform_action(choice)
    case choice
    when 1 then @app.list_items
    else
      puts 'Invalid option. Please choose again.'
    end
  end
end
