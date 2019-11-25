require_relative 'test_helper'
# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/wagon_train'

class WagonTrainTest < MiniTest::Test

  def test_that_it_exists_with_list
    wt = WagonTrain.new

    assert_instance_of WagonTrain, wt
    assert_instance_of LinkedList, wt.list
  end

  def test_can_append_to_list
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})

    assert_equal "Burke", wt.list.head.family_name
    assert_equal 1, wt.count
  end

  def test_can_append_to_list_a_second_time
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})
    wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
    wt.list.insert(1, "West", {"pounds of food" => 300})

    assert_equal "West", wt.list.head.next_node.family_name
    assert_equal 3, wt.count
    assert_equal 500, wt.supplies["pounds of food"]
  end


end
