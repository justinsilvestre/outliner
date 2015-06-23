require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@item1 = items(:one)
  end

  test "content should be present" do
  	@item1.content = nil
  	assert_not @item1.valid?
  end
end
