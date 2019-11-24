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
        @list_size += 1
        @head.next_node = (family_name = Node.new(family_name))
      else
        until @head.next_node == nil
          @head = @head.next_node
        end
        @list_size += 1
        @head.next_node = (family_name = Node.new(family_name))
      end
      return @head = head_storage
    end
  end

  def count
    @list_size
  end

  def to_string
    if @head.next_node == nil
      "The #{head.family_name} family"
    else
      head_storage = @head
      family_list = "The #{@head.family_name} family"
      while @head.next_node != nil
        @head = @head.next_node
         next_family = ", followed by the #{@head.family_name} family"
        family_list = family_list + next_family
      end
      @head = head_storage
      family_list
    end
  end

end
