require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    test "fixture" do
      product = products(:test)
      product.name = "Something Else"
      assert product.save, product.errors.full_messages
      assert_equal "Something Else", product.name
    end
    test "fixture again" do
      product = products(:test)
      assert_equal "Example", products(:test).name
    end
end
