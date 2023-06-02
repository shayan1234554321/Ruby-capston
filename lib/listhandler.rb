require 'tp'

module ListHandler
  def listObjArr array, params_array
    data = []
    collection.each_with_index do |item, index|
      object = {}
      object['item']=index.to_s
      array.each do |var|
        object[var.to_s] = item.var.to_s
      end
      data.push(object)
    end
    tp object
  end
end