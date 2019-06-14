class WordReader
  def self.read_from_file(file_name)
    if File.exist?(file_name)
      lines = File.readlines(file_name, chomp:true, encoding:('UTF-8'))
      lines.sample
    else
      return nil
    end
  end
end
