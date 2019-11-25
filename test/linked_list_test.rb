require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < MiniTest::Test

  def test_that_it_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_head_starts_at_nil
    list = LinkedList.new

    assert_nil list.head
  end

  def test_nodes_goes_into_head
    list = LinkedList.new
    list.append("West")

    assert_instance_of Node, list.head
    assert_nil list.head.next_node
    assert_equal 1, list.count
    assert_equal "The West family", list.to_string
  end

  def test_second_node_goes_into_head_next
    list = LinkedList.new
    list.append("Rhodes")
    list.append("Hardy")

    assert_equal "Hardy", list.head.next_node.family_name
    assert_equal 2, list.count
    assert_equal "The Rhodes family, followed by the Hardy family", list.to_string
  end

  def test_third_node_goes_into_head_next_next
    list = LinkedList.new
    list.append("West")
    list.append("Second")
    list.append("Third")

    assert_equal "Third", list.head.next_node.next_node.family_name
    assert_equal 3, list.count
  end

  def test_new_head
    list = LinkedList.new
    list.append("First")
    list.append("Second")
    list.append("Third")

    assert_equal "First", list.head.family_name
    list.prepend('Fourth')

    assert_equal "Fourth", list.head.family_name
    assert_equal "First", list.head.next_node.family_name
  end

  def test_add_new_head
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")

    assert_equal "McKinney", list.head.family_name
    assert_equal 3, list.count
  end

  def test_insert_new_family
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert_equal "Lawson", list.head.next_node.family_name
    assert_equal 4, list.count
  end

  def test_find_nodes_by_position_and_range
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert_equal "The Brooks family", list.find(2,1)
    assert_equal "The Lawson family, followed by the Brooks family, followed by the Henderson family", list.find(1, 3)
  end

  def test_if_names_are_included
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert_equal true, list.includes?("Brooks")
    assert_equal false, list.includes?("Chapman")

    list.insert(2, "Chapman")

    assert_equal true, list.includes?("Chapman")
  end

  def test_pop_deletes_last_element
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.append("Chapman")
    require "pry"; binding.pry

    assert_equal "The Chapman died of dysentery", list.pop
    assert_equal 3, list.list_size
  end
end
