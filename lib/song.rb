sorequire 'pry'
class Song

	attr_accessor :artist, :name

	def initialize(name)
	@name= name

	end

	def self.new_by_filename(filename)
		new_song_name = filename.split(" - ")[1]
		new_song_artist = filename.split(" - ")[0]
		# binding.pry
		
		song = Song.new(new_song_name)
		artist_instance = Artist.find_or_create_by_name(new_song_artist)
		artist_instance.songs << song
		# binding.pry
		song.artist = artist_instance
		song
		binding.pry
		# @artist << artist_instance	
	end




end