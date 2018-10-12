class Artist
  attr_accessor :name, :songs


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
    self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    # all.each do  |artist|
    #   if artist.name
    #     return artist
    #   else
    #     return Artist.new(name)
    #   end
    # end

    found_artist = self.all.find do |artist|
      artist.name == name
    end

    if found_artist == nil
      Artist.new(name).save
    else
      found_artist
    end


  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
