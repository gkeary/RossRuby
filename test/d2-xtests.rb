# This file should be copied into a test ending in 'tests.rb' so that
# the Rakefile knows it's a test.

require "set-standalone-test-paths.rb" unless $started_from_rakefile
require 'test/unit'
require 's4t-utils'
include S4tUtils

## Require either the particular file under test like this:
# require 'rossruby/my-file'
## or the entire package:
require 'Ross'
require 'bin/user'

##
## primary purpose is to test Ross mix ins
## TODO: provide some user tests
## TODO: provide some user functionality
class D2Tests < Test::Unit::TestCase
  ## You probably want to include your library so that you don't have
  ## to tack D2:: onto every name, but I won't assume
  ## that.
  include Ross

  def setup
    @db_script_array = "#{CONFIGS}NH/DBSCRIPTS",
            "#{CONFIGS}MA/DBSCRIPTS",
            "#{CONFIGS}CT/DBSCRIPTS",
            "#{CONFIGS}VT/DBSCRIPTS",
            "#{CONFIGS}ME/DBSCRIPTS"
    @u= User.new()


  end

  def teardown
  end

  def test_sql_sites
    #usr =User.new( "user", "pw", "db", "site", "folder")
    # this means you can still use an empty constructor...
    # so let's see if you can assign some attributes after using the vanilla constructor...

    #@u.user='rgk'
    #puts @u.inspect
    # puts @db_script_array
    # puts @u.sql_sites

    assert_equal(@db_script_array, @u.sql_sites, "site_array has a problem")
  end
end
