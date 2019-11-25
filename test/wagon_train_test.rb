require 'minitest/autorun'
require 'minitest/pride'
require './lib/wagon_train'

class WagonTrainTest < MiniTest::Test

  def test_that_it_exists_with_list
    wt = WagonTrain.new

    assert_instance_of WagonTrain, wt
    assert_instance_of LinkedList, wt.list
  end

  def test_can_append_to_list
    wt = WagonTrain.new
    wt.append("Burke")

    assert_equal "Burke", wt.list.head.family_name
    assert_equal 1, wt.count
  end

  def test_can_append_to_list_a_second_time
    wt = WagonTrain.new
    wt.append("Burke")
    wt.append("West")

    assert_equal "West", wt.list.head.next_node.family_name
    assert_equal 2, wt.count
  end


end
