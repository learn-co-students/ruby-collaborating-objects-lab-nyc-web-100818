class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  # this method turns the artist name from a string to an object
  # We need to get the instance  of the Artist class that represents that artist. Two possibilities:
  # 1. Create a new instance if that Artist instance doesn't exist
  # 2. Find the instance of that Artisti if it already exists
  # 3. Use the previously created .find_or_create_by_name method defined in Artist class
  # Finally we assign the song to that instance of Artist class
  def artist_name=(name)
    self.artist =Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    filename_array = filename.split(" - ")
    song = Song.new(filename_array[1])
    song.artist_name = filename_array[0]
    song
  end

end #end of Song class
