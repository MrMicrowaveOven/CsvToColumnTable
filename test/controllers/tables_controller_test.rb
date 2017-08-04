require 'test_helper'

class TablesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "make_table" do
    assert_equal(
      [["a", "d", "g"], ["b", "e", nil], ["c", "f", nil]],
      Table.make_table("a,b,c,d,e,f,g", 3)
    )
  end
end
