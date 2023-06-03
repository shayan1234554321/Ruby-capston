require 'tp'

module ListHandler
  def list_obj_arr(array, params_array)
    data = []
    array.each_with_index do |item, index|
      object = {}
      object['item'] = index.to_s
      params_array.each do |var|
        object[var.to_s] = item.var.to_s
      end
      data.push(object)
    end
    # data.empty? ? puts "Empty" : puts data
    puts data
  end
end
