require "set-standalone-test-paths.rb" unless $started_from_rakefile
require 'test/unit'
require 's4t-utils'
include S4tUtils

class MapTest < Test::Unit::TestCase
## Require either the particular file under test like this:
# require 'ross/my-file'
## or the entire package:
require '../bin/drive_map'
require 'lib/rossruby'

  ## You probably want to include your library so that you don't have
  ## to tack Ross:: onto every name, but I won't assume
  ## that.
  include Ross

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
		system("net use z: /delete")
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

def test_map_to_woody
    dm= DriveMap.new

    #dm.unmap_z
    ip_string = "192.168.1.230"
    if dm.ping?(ip_string) then
      dm.map_z(ip_string)
    else
      puts "ip_error: #{ip_string}"
    end

    #dm.map_z             
	
  assert_equal(["NH", "MA", "VT", "CT", "ME"],site_array,"site_array Malfunction")
end
def test_user_array
  assert_equal(6,user_array.size,"user_array has wrong size")
end
end


