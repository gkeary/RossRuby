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
 include SpareUtil

class DriveMap
  include SpareUtil

  def self.map_z(ip_string)
    `net use z: \\\\#{ip_string}\\c`
  end

  def self.unmap_z
    `net use z: /delete`
  end

  def self.can_ping?(ip_string)
    `ping #{ip_string} -n 1 -w 10`
    return $? == 0 ? true : false
  end

end

if $0 == __FILE__
  with_pleasant_exceptions do
    dm= DriveMap.new
    #dm.unmap_z
    ip_string = "192.168.1.230"
    if dm.can_ping?(ip_string) then
      dm.map_z(ip_string)
    else
      puts "ip_error: #{ip_string}"
    end
  end
end
