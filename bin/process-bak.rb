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
require 'lib/spare-util.rb'

class Bak
  include SpareUtil
  #include Pathname
  attr_accessor :destination_dir

  def initialize(destination_dir="c:/hotspare/bak")
    @destination_dir=destination_dir
  end

  def map_woody
    ip_string = "192.168.1.230"
    DriveMap::map_z(ip_string)
    #puts `net use`
  end


  def get_backup_filelist
    Dir.chdir(BACKUP_FOLDER)
    return Dir.glob('*')
  end

  def get_destination_filelist
    Dir.chdir(@destination_dir)
    return Dir.glob('*')
  end

  def get_just_one
    #destination_dir="c:/hotspare/bak"
    #a= "z:/DBbackup/dispatch_ct/*_ct_*.bak"
    p = Pathname.new("z:/DBbackup/dispatch_ct")
    latest = p.most_recent_file(matching=/_ct_/)
    #puts "latest #{latest}"
    FileUtils.cp latest, @destination_dir
  end

  def get_site_bak(site='CT')
    #a= "z:/DBbackup/dispatch_ct/*_"+ site + "_*.bak"
    #dd = Dir["z:/DBbackup/dispatch_ct/*_"+ site + "_*.bak"]
    FileUtils.cp Dir["z:/DBbackup/dispatch_ct/*_"+ site + "_*.bak"],
                 @destination_dir
  end


  def prune_destination(site='NH')
    glob = "c:/hotspare/bak/"
    db_name = case site     # looks very brittle...
      when 'NH' then
        config_array[0][:db]
      when 'MA' then
        config_array[1][:db]
      when 'VT' then
        config_array[2][:db]
      when 'OLDSTONE' then
        config_array[3][:db]
      when 'CT' then
        config_array[4][:db]
      when 'CT1' then
        config_array[5][:db]
      when 'ME' then
        config_array[6][:db]
      else
        throw "Should not occur"
    end
    glob << db_name  + "*.bak"
    file_array = Dir[glob]
    #puts "file array size: #{file_array.size}"
    file_array.each do |x|
      puts "File to erase: #{x}"
      #FileUtils.rm x
    end
  end

  def clear_destination
    puts "Dest dir = #{@destination_dir}"
    FileUtils.rm Dir[@destination_dir]

  end

end
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

  def self.has_drive?
    # back tics return STDOUT while calls to system() do not...  !!!
    `net use `.include?("Z:")
  end

end

class User
  include SpareUtil
  attr_accessor :usr, :pw, :db_name, :site, :dispatch_folder
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
    bk= Bak.new
    #puts bk.sites
    #puts bk.config_array
    bk.map_woody unless DriveMap::has_drive?
    bk.sites do |location|
      puts" location= #{location}"
      bk.prune_destination(site=location)
      #bk.get_site_bak location
    end
    puts "Destination contents: #{bk.get_destination_filelist}"
  end
=begin
  def config_array
      pw = '123ross321'
      u = [ {:k=>'NH', :usr=>'nhuser', :pw=>pw, :ip=>ip_by_site('NH'),:db=>'dispatch_production',:host=>'NHdispatch2003'},
            {:k=>'MA', :usr=>'mauser', :pw=>pw, :ip=>ip_by_site('MA'),:db=>'dispatch_sutton',:host=>'NHdispatch2003'},
            {:k=>'VT', :usr=>'vtuser', :pw=>pw, :ip=>ip_by_site('VT'),:db=>'dispatch_vt',:host=>'NHdispatch2003'},
            {:k=>'OLDSTONE', :usr=>'sa', :pw=>pw, :ip=>ip_by_site('OLDSTONE'),:db=>'dispatch_ct',:host=>'NHdispatch2003'},
            {:k=>'CT', :usr=>'ctuser', :pw=>pw, :ip=>ip_by_site('CT'),:db=>'dispatch_ct',:host=>'NHdispatch2003'},
            {:k=>'CT1', :usr=>'ctuser', :pw=>pw,:ip=>ip_by_site('CT'),:db=>'dispatch_ct',
                      :ip1=>'75.149.140.61', :host=>'RossTS'},
            {:k=>'ME', :usr=>'meuser', :pw=>pw, :ip=>ip_by_site('ME'),:db=>'dispatch_me',:host=>'NHdispatch2003' }
      ]
      return u
  attr_accessor :k,:usr, :pw, :ip, :db_name, :site, :dispatch_folder,:host

  end
=end



end
