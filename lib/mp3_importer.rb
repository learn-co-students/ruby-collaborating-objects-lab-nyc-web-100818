require 'pry'

class MP3Importer

  attr_accessor :path
  
  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir["#{@path}/*"].each {|file| files << file }
    files.map{ |file| file.split("/").last }
  end

  def import
    files = self.files
    files.each { |file| Song.new_by_filename(files) }
  end

end
