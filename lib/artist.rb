# require 'pry'
class Artist

	@@all_artists = []

	attr_accessor :name, :songs

	def initialize(name)
		@name = name
		@songs = []
	end
		
	def add_song(new_song)
		@songs << new_song
		new_song.artist = self
	end

	def self.all 
		@@all_artists 
	end

	def save
		self.class.all << self 
	end

	def self.create_by_name(new_name)
  		artist = Artist.new(new_name)
  		artist.save
  		artist
  	end

  	def self.find_by_name(name)
  		@@all_artists.find {|artist| artist.name == name}
  		# binding.pry
  	end


	def self.find_or_create_by_name(name)
  		if self.find_by_name(name) 
  			self.find_by_name(name)
  		else 
  			self.create_by_name(name)
  		end
  	end
	
	def print_songs
		self.songs.each do |song|
		puts song.name
		end
	end
	 
end