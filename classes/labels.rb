class LablesArray
  attr_accessor :labels

  def initialize
    @labels = []
  end

  def new_label(label)
    @labels << label
  end

  def locate(id)
    @labels.select { |label| label.id == id }.pop
  end
end
