require 'pry'
class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries("#{path}").select {|file| file.include?(".mp3")}

  end
#MP3Importer #files normalizes the filename to just the mp3 filename with no path

  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
