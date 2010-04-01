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

class BackupTests < Test::Unit::TestCase
  ## You probably want to include your library so that you don't have
  ## to tack Hotspare:: onto every name, but I won't assume
  ## that.
include SpareUtil
# Called before every test method runs. Can be used
  # to set up fixture information.

  def setup
    @b = Backup.new
    Dir.chdir('c:/Hotspare/backup')
    @actual_count = Dir.glob('*').size
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_backup_instance
	  assert_kind_of(Backup,@b,"b is not an instance of Backup")
  end

  def test_backup_count
   f_array = @b.get_files()
   assert_equal(9, f_array.size)
  end
end

