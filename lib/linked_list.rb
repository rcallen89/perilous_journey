#class file for the Linked List Class
require './lib/node'

class LinkedList
  attr_reader :head, :list_size

  def initialize
    @head = nil
    @list_size = 0
  end

  def append(family_name)
    head_storage = @head
    if @head == nil
      @list_size += 1
      @head = (family_name = Node.new(family_name))
    else
      if @head.next_node == nil
        @head.next_node = (family_name = Node.new(family_name))
      else
        until @head.next_node == nil
          @list_size += 1
          @head = @head.next_node
        end
        @head.next_node = (family_name = Node.new(family_name))
      end
      return @head = head_storage
    end
  end

  def count
    @list_size
  end

  def to_string
    if list_size == 1
      "The #{head.family_name} family"
    end
  end

end
