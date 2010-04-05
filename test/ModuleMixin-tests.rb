
# This file should be copied into a test ending in 'tests.rb' so that
# the Rakefile knows it's a test.

require "set-standalone-test-paths.rb" unless $started_from_rakefile
require 'test/unit'
require 's4t-utils'
include S4tUtils

## Require either the particular file under test like this:
# require 'spare-util/my-file'
## or the entire package:
 require 'spare-util'



class MixinTest < Test::Unit::TestCase
  include SpareUtil

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
#    puts site_array
#		puts user_array
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

def test_site_array
  assert_equal(["NH", "MA", "CT", "VT", "ME"],sites,"site_array Malfunction")
end
def test_user_array
  assert_equal(7,user_array.size,"user_array has wrong size")
end

def test_user_array
    assert_equal('RossTS',user_array[5][:ts],"CT RDP server not 'RossTS'")

  end

  def test_sites
    assert_equal(["NH", "MA", "CT", "VT", "ME"], sites, "Mistake in site_array"
    )
  end

end


