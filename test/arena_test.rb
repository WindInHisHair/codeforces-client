require 'test_helper'

module Codeforcesapi
  def self.problem(*args)
    o = OpenStruct.new
    o.preTestInputs = ['input0'] 
    o.preTestOutputs = ['output0']
    o
  end
end

class Arena
  def create_contest
  end
end

class ArenaTest < Minitest::Test
  def test_create_sample_test
    arena = Arena.new(1, nil)
    arena.create_sample_test('test.txt')
    contents = File.readlines('test.txt')
    File.delete('test.txt')

    assert_equal "Sample test\n", contents[0]
    assert_equal "input0\n",      contents[1]
    assert_equal "\n",            contents[2]
    assert_equal "output0\n",     contents[3]
  end
end 
