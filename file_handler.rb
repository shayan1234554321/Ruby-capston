require 'json'

module FileHandler
  def self.save(collection, filename)
    data = []
    collection.each do |item|
      object = {}
      item.instance_variables.each do |var|
        object[var.to_s.delete('@')] = item.instance_variable_get(var).to_s
      end
      data.push(object)
    end
    return if data.empty?

    Dir.mkdir('./data') unless File.directory?('./data')

    File.write("./data/#{filename}", JSON.pretty_generate(data))
  end

  def self.read_file(filename)
    if File.exist?(filename)
      file_content = File.read(filename)
      JSON.parse(file_content)
    else
      puts "File #{filename} does not exist!"
    end
  end
end
