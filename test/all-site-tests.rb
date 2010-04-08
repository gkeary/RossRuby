
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
    @bk = Bak.new(destination_dir= 'c:\HotSpare\bak')
    @bk.prune_destination('NH')
    assert_equal(5,count_bak_from_site('ct'), "Failed to prune site files from bak directory")
    map_this_site('NH') unless DriveMap::has_drive?
  end

  def count_bak_from_site(site='ct')
    if (1 == 1)
      Dir["c:/hotspare/bak/*" + site + "*.*"].size
    end
    #return 5
  end

  def map_this_site(site='ct')
    foo = config_array[3][:ip]
    puts "config_array[3][:ip] = #{foo}"
    DriveMap.map_z(foo)
  end

  def test_all_files_from_source_box
    @bk.get_site_bak
    bak_count = count_bak_from_site()
    assert_equal(5,
                 bak_count,
                 "Incorrect count #{bak_count} in c:/hotspare/bak"
    )
  end

  def test_copy_one_from_source_box
    count_before = count_bak_from_site()
    @bk.get_just_one
    count_after = count_bak_from_site()
    bak_count =  count_before - count_after +1
    assert_equal(1,
                 bak_count,
                 "Incorrect count #{bak_count} in c:/hotspare/bak"
    )
  end
 end
