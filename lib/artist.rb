require "pry"

class Artist
  attr_accessor :name, :artist_name, :songs

    @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(artist_name)
    found_artist = self.all.find do |artist|
      artist.name == artist_name
     end
   end

   def self.create_by_name(artist_name)
     new_artist = Artist.new(artist_name)
     new_artist.save
     new_artist
   end

  def self.find_or_create_by_name(artist_name)
    self.find_by_name(artist_name) || self.create_by_name(artist_name)
  end


  def print_songs
    @songs.each {|song| puts song.name}
  end


end
