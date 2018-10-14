class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

# load mp3s from a directory and removes the directory path, using Dir.glob to check directory with specified path and file extension and collect to store them into a new array
  def files
    Dir.glob("#{path}/*.mp3").collect do
      |file| file.gsub("#{path}/","")
    end
  end

# uses Song.new_by_filename method defined in Song class to create new song for each file imported using #import
  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end #end of MP3Importer class


# # All files in current directory
  # Dir.glob("*") - * for the directory path, otherwise al
# # All files containing "spec" in the name
  # Dir.glob("*spec*")
# # All ruby files
  # Dir.glob("*.rb"), - all files ending with .rb (.mp3, .avi etc.)
