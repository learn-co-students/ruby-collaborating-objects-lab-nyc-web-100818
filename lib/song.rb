class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    @artist = artist
  end

  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
    @artist.add_song(self)
  end

  def self.new_by_filename(file_name)
    pre = file_name.chomp(".mp3")
    song = pre.split(" - ")[1]
    music_maker = pre.split(" - ")[0]
    new_song = Song.new(song)
    new_song.artist_name = music_maker
    new_song
  end
end
