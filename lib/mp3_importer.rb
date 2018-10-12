require 'pry'
class MP3Importer
  attr_accessor :path, :song

  def initialize(path)
    @path = path
  end

  def files #returns an array
    directory_array = Dir.entries(@path)
    directory_array.slice(2,directory_array.length)
  end

  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end 
  end

end
# it 'imports the files into the library by creating songs from a filename' do
#   test_music_path = "./spec/fixtures/mp3s"
#   music_importer = MP3Importer.new(test_music_path)
#
#   expect(Song).to receive(:new_by_filename).at_least(4).times
#   music_importer.import
