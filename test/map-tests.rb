
# This file should be copied into a test ending in 'tests.rb' so that
# the Rakefile knows it's a test.

require "set-standalone-test-paths.rb" unless $started_from_rakefile
require 'test/unit'
require 's4t-utils'
include S4tUtils

## Require either the particular file under test like this:
# require 'spare-util/my-file'
## or the entire package:
# require 'spare-util'

## Require either the particular file under test like this:
# require 'spare-util/my-file'
## or the entire package:
 require 'spare-util'

class MappingTest < Test::Unit::TestCase
## Require either the particular file under test like this:
# require 'ross/my-file'
## or the entire package:
  require '../bin/drive_map'
  require 'spare-util'

  ## You probably want to include your library so that you don't have
  ## to tack Ross:: onto every name, but I won't assume
  ## that.
  include SpareUtil

  

  def test_bad_ip
    ip_string = "111.11.11.1"
    assert_equal(false, DriveMap::can_ping?(ip_string), "ping failed w/ bad ip")
  end

  def test_good_ip
    ip_string = '192.168.1.230'  # woody at my house...
    assert_equal(true, DriveMap::can_ping?(ip_string), "ping failed w/ good ip")
  end

  # good : system("ping 192.168.1.230 -n 1 -w 10")
  # bad : system("ping 11.1.1.1 -n 1 -w 10")

  def test_unmap
    if ! DriveMap::has_drive?
      DriveMap::map_z("192.168.1.230")
    end
    DriveMap::unmap_z
    assert_equal(false, DriveMap::has_drive?, "NET USE still shows a Z: drive")
  end
    
  def test_map_to_woody
    ip_string = "192.168.1.230"
    if DriveMap::can_ping?(ip_string) then
      DriveMap::map_z(ip_string)
      assert_equal(true, DriveMap::has_drive?, "Drive Z missing")
    else
      flunk "IP ERROR for Woody"
    end
  end

 end


