require 'pry'
class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
    @songs << song
    @songs.count
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find do |artist|
      artist.name == name
    end

    if artist == nil
      Artist.new(name)
    else
      return artist
    end
  end

  def print_songs
    # binding.pry
    @songs.each do |song|
    puts song.name
    end
  end


end
