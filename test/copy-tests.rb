
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

class CopyTest < Test::Unit::TestCase
## Require either the particular file under test like this:
# require 'ross/my-file'
## or the entire package:
  require '../bin/copy-bak'
  require 'spare-util'

  ## You probably want to include your library so that you don't have
  ## to tack Ross:: onto every name, but I won't assume
  ## that.
  include SpareUtil

  def setup
    @bk = Bak.new
    @bk.clear_destination
    assert_equal(0,Dir["c:/hotspare/bak/*"].size, "Failed to clear out bak directory")
    @bk.map_woody unless DriveMap::has_drive?
  end

  def test_ct_from_woody
    @bk.get_ct_bak
    count_bak =  Dir["c:/hotspare/bak/*.*"].size
    assert_equal(5,
                 count_bak,
                 "Incorrect count #{count_bak} in c:/hotspare/bak"
    )
  end

  def test_copy_one_from_woody
    @bk.get_just_one
    count_bak =  Dir["c:/hotspare/bak/*.*"].size
    assert_equal(1,
                 count_bak,
                 "Incorrect count #{count_bak} in c:/hotspare/bak"
    )
  end
 end


