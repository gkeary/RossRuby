#!/usr/bin/ruby

### The following adjusts the load path so that the correct version of
### a self-contained package is found, no matter where the script is
### run from. 
require 'pathname'
$:.unshift((Pathname.new(__FILE__).parent.parent + 'lib').to_s)
require 'spare-util/third-party/s4t-utils/load-path-auto-adjuster'


require 's4t-utils'
include S4tUtils


require 'spare-util'
# You probably want to include your module as well, but I won't assume
# that. 
# include SpareUtil
require 'pathname'
require 'lib/spare-util/pathname.rb'

class Bak
 include SpareUtil
 #include Pathname
 def map_woody
 ip_string = "192.168.1.230"
 DriveMap::map_z(ip_string)
 #puts `net use`
 end

 def get_just_one
   destination_dir="c:/hotspare/bak"
   #a= "z:/DBbackup/dispatch_ct/*_ct_*.bak"
   p = Pathname.new("z:/DBbackup/dispatch_ct")
   latest = p.most_recent_file(matching=/_ct_/)
   #puts "latest #{latest}"
   FileUtils.cp latest,destination_dir
 end

 def get_ct_bak
   destination_dir="c:/hotspare/bak"

   a= "z:/DBbackup/dispatch_ct/*_ct_*.bak"
   dd = Dir[a]
   FileUtils.cp dd,destination_dir
 end

def clear_destination
  FileUtils.rm Dir["c:/hotspare/bak/*.*"]
end

 end


if $0 == __FILE__
  with_pleasant_exceptions do
    bk= Bak.new
    bk.clear_destination
    bk.map_woody unless DriveMap::has_drive?
    bk.get_ct_bak
  end
end
