require 'json'

module FileHandler
  def save(collection, filename)
    data = []
    collection.each do |item|
      object = {}
      item.instance_variables.each do |var|
        object[var.to_s.delete('@')] = item.instance_variable_get(var).to_s
      end
      data.push(object)
    end
    Dir.mkdir('./data') unless File.directory?('./data')
    File.write("./data/#{filename}.json", JSON.generate(data))
  end

  def read_file(filename)
    if File.exist?("./data/#{filename}.json")
      file_content = File.read("./data/#{filename}.json")
      JSON.parse(file_content)
    else
      []
    end
  end
end
