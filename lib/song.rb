require "pry"

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song_name = filename.split("-")[1].strip
    artist_name = filename.split("-")[0].strip
    song = Song.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    song.artist = artist
    artist.songs << song
    song
  end

end
