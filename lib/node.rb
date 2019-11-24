#class file for the Node Class

class Node
  attr_reader :family_name
  attr_accessor :next_node
  def initialize(family_name)
    @family_name = family_name
    @next_node = nil
  end
end
