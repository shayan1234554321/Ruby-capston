require_relative '../classes/music_album'

describe MusicAlbum do
  let(:genre) { double('genre') }
  let(:album) { MusicAlbum.new(genre, 'Pink Floyd', 'Vinyl', 'EMI', Time.new(2000, 1, 1), true) }
  let(:archived_album) do
    MusicAlbum.new(genre, 'The Beatles', 'CD', 'Apple Records', Time.now - (10 * 365 * 24 * 60 * 11), true)
  end

  describe '#initialize' do
    it 'creates a new music album with a genre, author, source, label, publish date and on_spotify flag' do
      expect(album.genre).to eq genre
      expect(album.author).to eq 'Pink Floyd'
      expect(album.source).to eq 'Vinyl'
      expect(album.label).to eq 'EMI'
      expect(album.publish_date).to eq Time.new(2000, 1, 1)
      expect(album.on_spotify).to be true
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the music album can be archived' do
      expect(album.can_be_archived?).to be true
    end

    it 'returns false if the music album cannot be archived' do
      expect(archived_album.can_be_archived?).to be false
    end

    it 'returns false if the music album is not on Spotify' do
      album.on_spotify = false
      expect(album.can_be_archived?).to be false
    end
  end
end
