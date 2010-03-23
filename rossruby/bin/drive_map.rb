#!/usr/bin/ruby

### The following adjusts the load path so that the correct version of
### a self-contained package is found, no matter where the script is
### run from.
require 'pathname'
$:.unshift((Pathname.new(__FILE__).parent.parent + 'lib'+ 'ross').to_s)
require 'ross/third-party/s4t-utils/load-path-auto-adjuster'


require 's4t-utils'
include S4tUtils

require 'ross'
# You probably want to include your module as well, but I won't assume
# that.
include Ross

class DriveMap
  include Ross

  def map_z(ip_string)
    #s = ' \\woody\c '
    #s = ' \\192\.168\.1\.230\c '
    #system('net use z: ' + s)
    #system("net use" + " z:" + " \\\\192.168.1.230\\c")

    line = "net use" + " z: " + "\\\\#{ip_string}\\c"
    puts line
    system(line)
  end

  def unmap_z
    system('net use z: /delete')
  end

  def ping?(ip_string)
    system "ping " + ip_string
    return $? == 0 ? true : false
  end
end


if $0 == __FILE__
  with_pleasant_exceptions do
    dm= DriveMap.new

    #dm.unmap_z
    ip_string = "192.168.1.230"
    if dm.ping?(ip_string) then
      dm.map_z(ip_string)
    else
      puts "ip_error: #{ip_string}"
    end

    #dm.map_z             

  end
end