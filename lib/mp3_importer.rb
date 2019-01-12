class MP3Importer
  attr_reader :path

  def initialize(path) #accepts a file path to parse mp3 files from
    @path = path
  end

# loads all the mp3 files in the path directory . normalizes the filename to just the mp3 filename with no path
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect do  |f|
       f.gsub("#{path}/", "")
    end 
  end

#imports the files into the library by creating songs from a filename
  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
