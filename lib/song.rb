class Song
  attr_accessor :name, :artist
  #sets the song name #artist sets the artist object to belong to the song

  @@all = []

  def initialize(name)
    @name = name
  end

  #creates a new instance of a song from the file that's passed
  #associates new song instance with the artist from the filename
  #WRONG
  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end

  def self.find_by_artist(artist)
    Song.all.select do | song |
      song.artist == artist
    end
  end


  def self.all
    @@all
  end

#method that takes in Song name as string and gets the artist object
            #use helper method Song#artist() to associate new song with an artis
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end


  def save
    @@all << self
    self
  end
end
