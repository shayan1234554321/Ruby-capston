class Item
  attr_reader :id, :publish_date
  attr_accessor :genre, :author, :source, :lable
  def initialize(publish_date)
    @id = Random.rand(1..10000)
    @genre = 
    @author =
    @source =
    @lable =
    @publish_date =
    @archived = false
  end

  def set_genre(genre)
    @genre = genre
  end

  def move_to_archive
    @archived = true
  end

  private
  def can_be_archived?
    
  end
end