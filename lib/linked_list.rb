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


  def prepend(family_name)
    original_head = @head
    new_head = Node.new(family_name)
    new_head.next_node = original_head
    @list_size += 1
    @head = new_head
  end

  def insert(position, family_name)
    if position == 0
      prepend(family_name)
    elsif position > @list_size
      append(family_name)
    else
      #Position is similar to an array 0 = head, 1 = head.next_node...etc
      inserted_family = Node.new(family_name)
      original_head = @head
      (position - 1).times do
        @head = @head.next_node
      end
      previous_head = @head
      pushed_family = previous_head.next_node
      previous_head.next_node = inserted_family
      inserted_family.next_node = pushed_family
      @head = original_head
      @list_size += 1
      inserted_family
    end
  end

  def find(start_position, number_of_positions)
    if number_of_positions > @list_size
      number_of_positions = (@list_size - start_position)
    end
    if start_position > @list_size
      start_position = @list_size - 1
      number_of_positions = (@list_size - start_position)
    end
    original_head = @head
    start_position.times do
      @head = @head.next_node
    end
    family_list = "The #{@head.family_name} family"
    (number_of_positions - 1).times do
      @head = @head.next_node
       next_family = ", followed by the #{@head.family_name} family"
      family_list = family_list + next_family
    end
    @head = original_head
    family_list
  end


end
