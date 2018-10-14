require 'pry'

class Artist

  attr_accessor :name,:songs
  @@all=[]

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    # an instance of Song can be passed into add_song as an argument e.g. s1 = Song.new("Rock With You"), add_song(s1) will push s1 into @songs
    @songs << song
  end

  def print_songs
    # if @songs included s1, print_songs would iterate through @songs and call #name on s1 => s1.name ; which would access the #name method from Song class and return the song name
    @songs.each do |song|
      puts song.name
    end
  end


  # this helper class method finds the Artist instance with the name that's passed in as an argument
  def self.find_by_name(name)
    Artist.all.find do |artist|
      artist.name == name
    end
  end

  #this helper class method creates a new instance of Artist and adds it to @@all taking in a name as an argument
  def self.create_by_name (name)
    artist = self.new(name)
    artist.save
    artist
  end

  # this method combines .find_by_name and .create_by_name
  def self.find_or_create_by_name (name)
    if self.find_by_name (name)
      self.find_by_name (name)
    else
      self.create_by_name (name)
    end
  end

  def save
    @@all << self
  end

end #end of Artist class

# binding.pry
