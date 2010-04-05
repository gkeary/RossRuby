
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

class AllSiteTest < Test::Unit::TestCase
## Require either the particular file under test like this:
# require 'ross/my-file'
## or the entire package:
  require '../bin/process-bak'
  require 'spare-util'

  ## You probably want to include your library so that you don't have
  ## to tack Ross:: onto every name, but I won't assume
  ## that.
  include SpareUtil

  def setup
    @bk = Bak.new
    @bk.prune_destination
    assert_equal(0,Dir["c:/hotspare/bak/*"].size, "Failed to prune site files from bak directory")
    @bk.map_this_site(site) unless DriveMap::has_drive?
  end

  def test_all_files_from_source_box
    @bk.get_site_bak
    #count_bak =  Dir["c:/hotspare/bak/*.*"].size
    assert_equal(5,
                 count_bak_from_site,
                 "Incorrect count #{count_bak} in c:/hotspare/bak"
    )
  end

  def test_copy_one_from_source_box
    @bk.get_just_one
    #count_bak =  Dir["c:/hotspare/bak/*.*"].size
    assert_equal(1,
                 count_bak_from_site,
                 "Incorrect count #{count_bak} in c:/hotspare/bak"
    )
  end
 end
