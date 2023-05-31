require_relative 'item'

class MusicAlbum < Item
  attr_accessor :title, :artist, :genre, :release_date, :label, :on_spotify

  def initialize(release_date, on_spotify)
    super(release_date)
    @on_spotify = on_spotify
    MusicAlbum.all << self
  end

  def can_be_archived?
    super && @on_spotify
  end

  def self.all
    @all ||= []
  end

  def self.create
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Source: '
    source = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp
    print 'Is it on Spotify?: '
    on_spotify = gets.chomp

    music_album = MusicAlbum.new(genre, author, source, label, publish_date, on_spotify)
    puts 'Album created successfully.'
    music_album
  end

  def self.load
    return unless File.exist?('./data/music_albums.json')

    albums = FileHandler.read_file('./data/music_albums.json')
    albums.map do |albums_hash|
      MusicAlbum.new(
        albums_hash['genre'],
        albums_hash['author'],
        albums_hash['source'],
        albums_hash['label'],
        albums_hash['publish_date'],
        albums_hash['on_spotify']
      )
    end
  end
end
