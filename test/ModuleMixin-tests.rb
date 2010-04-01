require "set-standalone-test-paths.rb" unless $started_from_rakefile
require 'test/unit'
require 's4t-utils'
include S4tUtils

class MixinTest < Test::Unit::TestCase
## Require either the particular file under test like this:
# require 'ross/my-file'
## or the entire package:
require '../bin/drive_map'
require 'lib/rossruby'

  ## You probably want to include your library so that you don't have
  ## to tack Ross:: onto every name, but I won't assume
  ## that.
  include RossRuby

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
  assert_equal(["NH", "MA", "VT", "CT", "ME"],site_array,"site_array Malfunction")
end
def test_user_array
  assert_equal(6,user_array.size,"user_array has wrong size")
end

def test_user_array
    assert_equal('RossTS',user_array[4][:ts],"CT RDP server not 'RossTS'")
=begin
  this from rossruby.rb....
    u = [ {:k=>'NH',:usr=>'nhuser',:pw=>pw,:ip=>'192.168.1.89'},
          {:k=>'MA',:usr=>'mauser',:pw=>pw,:ip=>'192.168.2.89'},
          {:k=>'VT',:usr=>'vtuser',:pw=>pw,:ip=>'192.168.3.89'},
          {:k=>'CT',:usr=>'ctuser',:pw=>pw,:ip=>'192.168.4.89'},
          {:k=>'CT1',:usr=>'ctuser',:pw=>pw,:ip=>'192.168.1.23',:ip1=>'75.149.140.61',:ts=>'RossTS'},
          {:k=>'ME',:usr=>'meuser',:pw=>pw,:ip=>'192.168.5.89'}
        ]

=end

  end

  def test_sites
    assert_equal(
            ["NH", "MA", "VT", "CT", "ME"],
            site_array, "Mistake in site_array"
    )
  end

end


