require 'pry'
class MP3Importer

  attr_accessor :path

  @@all = []

  def initialize(path)
    # binding.pry
    @path = path
  end

  # def path
  #   @path
  # end
  # ###`MP3Importer` class
  # Let's start with the MP3 Importer. Build an `MP3Importer` class that
  # parses a directory of files and sends the filenames to a song class
  # to create a library of music with artists that are unique. To do this,
  # you'll need two methods: `Mp3Importer#files` and `MP3Importer#import`.
  # Your `MP3Importer` class should also have a `path` attribute that gets
  # set on initialization.
  #
  # You should write code that responds to
  # `MP3Importer.new('./spec/fixtures').import`. Google around for how to get
  # a list of files in a directory! Make sure you only get `.mp3` files.
  # binding.pry

  def files
    files = []
    Dir.new(self.path).each do |file|
      files << file if file.length > 4
    end
    files
  end

  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
