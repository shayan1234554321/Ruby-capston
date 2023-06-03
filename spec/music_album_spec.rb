require_relative '../classes/music_album'

RSpec.describe MusicAlbum do
  let(:genres) { double('GenresArray') }
  let(:genre) { double('Genre') }

  describe '#add_genre' do
    it 'adds the music album to the genre' do
      allow(genres).to receive(:locate).with(1).and_return(genre)
      allow(genre).to receive(:add_item)

      music_album = MusicAlbum.new('Album 1', true, '2021-01-01')
      music_album.add_genre(1, genres)

      expect(genre).to have_received(:add_item).with(music_album)
    end
  end

  describe '#can_be_archived?' do
    context 'when the music album is on Spotify and can be archived' do
      it 'returns true' do
        music_album = MusicAlbum.new('Album 1', true, '2021-01-01')
        allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)

        expect(music_album.can_be_archived?).to be true
      end
    end

    context 'when the music album is not on Spotify' do
      it 'returns false' do
        music_album = MusicAlbum.new('Album 1', false, '2021-01-01')
        allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)

        expect(music_album.can_be_archived?).to be false
      end
    end

    context 'when the music album cannot be archived' do
      it 'returns false' do
        music_album = MusicAlbum.new('Album 1', true, '2021-01-01')
        allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)

        expect(music_album.can_be_archived?).to be false
      end
    end
  end
end
