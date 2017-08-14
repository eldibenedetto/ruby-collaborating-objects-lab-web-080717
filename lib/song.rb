require "pry"
class Song

  attr_accessor :name, :size, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    new_song = Song.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.artist.add_song(self)
    new_song
  end

end
