class MP3Importer

	attr_accessor :path

	def initialize(path)
		@path = path
	end

#import files from fixtures, add them into an array with just file names
	def files
		@files = []
		# Dir.new(self.path).each do |file|
		# files << file
		# end
		Dir.entries(path).select do |entry|
			if entry.include?('.mp3')
				@files << entry
			end
		end
		# files
	end

	def import
		self.files.each do |filename|
			Song.new_by_filename(filename)
		end
	end
end
