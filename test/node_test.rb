require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < MiniTest::Test
  def test_node_exists_with_defaults
    node = Node.new("Burke")

    assert_instance_of Node, node
    assert_equal "Burke", node.family_name
    assert_nil node.next_node
  end
end
