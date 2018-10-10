require 'pry'

class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    self.save
  end

  #sets song name to artist
  def add_song(song)
    song.artist = self
  end

  #looks up all songs with associated artist
  def songs
    Song.all_by_artist(self)
  end

  #gets @@all class variable
  def self.all
    @@all
  end

  #saves artist into class variable @@all
  def save
    @@all << self
  end

  #finds artists by name from @@all
  def self.find_by_name(name)
    self.all.find {|artist|
      artist.name == name
    }
  end

  #finds artist in @@all or create a new artist
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.new(name)
  end

  #prints all songs for this artist
  def print_songs
    self.songs.each{|song|
      puts song.name
    }
  end
end
