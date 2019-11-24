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
end
