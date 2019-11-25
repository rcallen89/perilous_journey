#class file for the Node Class

class Node
  attr_reader :family_name
  attr_accessor :next_node, :supply
  def initialize(family_name, supplies_at_create)
    @family_name = family_name
    @next_node = nil
    @supply = supplies_at_create
  end
end
