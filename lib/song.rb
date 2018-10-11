class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
    f_split = file_name.split(" - ").map{|s| s.split(".mp3")}.flatten
    new_song = self.new(f_split[1])
    new_song.artist = Artist.find_or_create_by_name(f_split[0])
    new_song.artist.songs << new_song
    new_song.artist.save
    # binding.pry
    new_song.genre = f_split[2]
    new_song
  end

end
