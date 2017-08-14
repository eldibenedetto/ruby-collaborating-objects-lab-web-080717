require "pry"
class MP3Importer

  attr_accessor :path


  def initialize(path)
    @path = path

  end

  def files
    file_path = Dir[@path + "/*.mp3"]
    filenames = file_path.join.split("/").select do |element|
      element.include?("-") == true
    end
    filenames.map do |filename|
      if filename.end_with?(".")
        filename.chomp!(".")
      else
        filename
      end

    end
  end

  def import
    files.map do |filename|
      Song.new_by_filename(filename)
    end
    # binding.pry
  end
  #  binding.pry

end
