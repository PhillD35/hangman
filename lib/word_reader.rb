class WordReader
  def self.read_from_file(file_path)
    if File.exist?(file_path)
      lines = File.readlines(file_path, chomp: true, encoding: 'UTF-8')
      lines.sample
    else
      abort "File data/words.txt does not exists.\nPlease run 'rube main.rb -n' to download a new word list or create one manually."
    end
  end
end
