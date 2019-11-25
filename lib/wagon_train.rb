#Class file for Wagon Train
require './lib/linked_list'

class WagonTrain
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def append(family_name)
    @list.append(family_name)
  end

  def count
    @list.count
  end

end
