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

  def test_third_node_goes_into_head_next
    list = LinkedList.new
    list.append("West")
    list.append("Second")
    list.append("Third")

    assert_equal "Third", list.head.next_node.next_node.family_name
    assert_equal 3, list.count
  end
end
