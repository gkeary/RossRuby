#!/usr/bin/ruby

### The following adjusts the load path so that the correct version of
### a self-contained package is found, no matter where the script is
### run from. 
require 'pathname'
$:.unshift((Pathname.new(__FILE__).parent.parent + 'lib').to_s)
require 'lib/rossruby/third-party/s4t-utils/load-path-auto-adjuster'

require 's4t-utils'
include S4tUtils

#include Ross

require 'lib/rossruby'
# You probably want to include your module as well, but I won't assume
# that. 
# include RossRuby

class User
  include RossRuby 
  attr_accessor :usr,:pw,:db_name,:site,:dispatch_folder
=begin
  def initialize( user, pw, db, site, folder)
    @user = user
    @pw = pw
    @db = db
    @site = site
    @folder = folder
    end
=end

end

if $0 == __FILE__
  with_pleasant_exceptions do
    # Your program here.
    puts sites
    puts sql_sites
    puts databases
    puts users
    #puts User.methods

  end
end
