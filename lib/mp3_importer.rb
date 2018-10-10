require 'pry'

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  #loads mp3s in directory and removes directory path
  def files
    Dir["#{path}/*"].map{|filename|
      filename.gsub("#{path}/","")
    }
  end

  #uses Song.new_by_filename to create new song for each file
  def import
    self.files.each{|filename|
      Song.new_by_filename(filename)
    }
  end

end
