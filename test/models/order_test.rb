require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "an order placed yesterday is returned by recent" do
    assert Order.recent.where(id: orders(:yesterday).id).exists?
  end

  test "an order placed yesterday is not returned by recent" do
    assert !Order.recent.where(id: orders(:old).id).exists?
  end
end
