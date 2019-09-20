require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")

class TestGuest < Minitest::Test

  def test_guest_has_name
    guest = Guest.new("Frank", 500, "I Will Survive")
    assert_equal("Frank", guest.name())
  end

end
