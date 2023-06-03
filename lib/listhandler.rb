require 'table_print'

module ListHandler
  def list_obj_arr(array, params_array)
    data = []
    array.each_with_index do |item, index|
      object = {}
      object['sel'] = index.to_s
      params_array.each do |var|
        object[var.to_s] = item.instance_variable_get("@#{var}").to_s
      end
      data.push(object)
    end
    # data.empty? ? puts "Empty" : puts data
    tp data
  end
end
