require "pry"

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["./spec/fixtures/mp3s/*"]
    files.map { |file| file.reverse.chomp("/s3pm/serutxif/ceps/.").reverse }
  end

  def import
    files.each { |file| Song.new_by_filename(file) }
  end
end
