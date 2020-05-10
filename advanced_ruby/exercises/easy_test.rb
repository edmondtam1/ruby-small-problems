# 1

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTest < MiniTest::Test

  def setup
    @value1 = 3
    @value2 = 'XYz'
    @value3 = nil
    @value4 = []
    @value5 = ['xyz']
    @value7 = Numeric.new
    @value8 = 3
    @value9 = 'hi'
  end
  
  def test_easy_1
    assert_equal(true, @value1.odd?)
  end

  def test_easy_2
    assert_equal('xyz', @value2.downcase)
  end

  def test_easy_3
    assert_nil(@value3)
  end

  def test_easy_4
    assert_equal(0, @value4.size)
    assert_equal(true, @value4.empty?)
    assert_empty(@value4)
  end

  def test_easy_5
    # assert_equal(true, @value5.include?('xyz'))
    assert_includes(@value5, 'xyz')
  end

  def test_easy_6
    # assert_raises(NoExperienceError) { @employee.hire }
  end

  def test_easy_7
    assert_instance_of(Numeric, @value7)
  end

  def test_easy_8
    assert_kind_of(Numeric, @value8)
  end

  def test_easy_9
    # assert_equal(@value9, @value9.process)
  end

  def test_easy_10
    refute_includes(@value5, 'xyx')
  end


end

