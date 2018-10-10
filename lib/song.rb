class Song
  attr_accessor :name, :artist

  @@all = []


  def initialize(name)
    @name = name
    @@all << self
  end

  #creates a new song from " - " delimited file name
  #creates a new artist and associates it with song
  def self.new_by_filename(filename)
    song_arr = filename.split(" - ")
    song = Song.new(song_arr[1])
    artist = Artist.new(song_arr[0])
    artist.add_song(song)
    song
  end

  def self.all
    @@all
  end

  #gets all songs that match the given artist
  def self.all_by_artist(artist)
    self.all.select{|song|
      song.artist == artist
    }
  end

end
