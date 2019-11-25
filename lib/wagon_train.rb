#Class file for Wagon Train
require './lib/linked_list'

class WagonTrain
  attr_reader :list
  def initialize
    @list = LinkedList.new
    @supplies = Hash.new(0)
  end

  def append(family_name, supplies_at_create)
    @list.append(family_name, supplies_at_create)
  end

  def count
    @list.count
  end

  def supplies
    @list.supplies
  end

end
