require 'pry'
class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  # #### `Song.new_by_filename`
  # This method will do four things:
  #
  # 1. It must parse a filename to find the song name and artist name. (*Hint: every file separates the song and artist with a `" - "`*). Now we put those values to use.
  #
  # 2. From here, we will create a new song instance using the string we gathered from the filename.
  #
  # 3. We'll also want to associate that new song with an artist. To do this we'll use a helper method: `Song#artist()`.
  #
  # 4. Return the new song instance.
  #
  # You may have seen something similar in the past where we have the instance
  # of the artist. If we had the artist object, we could simply assign
  # the artist to the song with some code that looks like this:
  # `our_song_instance.artist = our_artist_instance`. Since we only have the
  # artist name as a string (not an instance of the Artist class), we'll
  # create a method that takes in the name and gets the artist object. Let's
  # call this `Song#artist(artist_name)`.

  def self.new_by_filename(filename)
    track = filename.split(" - ")
    new_song = Song.new(track[1])

    artist = Artist.all.find do |artist|
      artist.name == track[0]
    end
    # binding.pry
    artist.add_song(new_song)
    new_song
  end
end
