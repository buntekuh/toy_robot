require 'minitest/autorun'
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
	module Lib
		class TestScopedAttrs
		  private_attr_accessor :private_attribute
		  
		  def initialize
		    self.private_attribute = 'private'
		  end
		
		  def get_private
		    private_attribute
		  end
		
		  # This method should fail, because a private attribute cannot be called explicitely
		  def get_private_self
		    self.private_attribute
		  end
		end
		
		class ScopedAttrAccessorsTest < Minitest::Test
		  def test_private_attr_accessor
			  test_class = TestScopedAttrs.new
		  	other_test_class = TestScopedAttrs.new
		
		  	assert_raises(NoMethodError) do
		    	test_class.private_attribute
		  	end
		    
		  	assert_equal 'private', test_class.get_private
		
		    assert_raises(NoMethodError) do
		      assert_equal 'private', test_class.get_private_self
		    end
		  end
		end
	end
end		
