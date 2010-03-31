# Require external libraries (whether in third-party or site_ruby) here:
require 's4t-utils'

# Require all library files in this package here:
require 'D2/version'
# require 'D2/some-file'
# require 'D2/another-file'

# Any comments written here will become
# the documentation for D2.
# That will be the first page shown when you 
# create the HTML documentation.
module D2
  BACKUP_FOLDER = 'C:/hotspare/backup/'
  APP_ROOT = 'C:/hotspare/SRC/'
  CONFIGS = 'C:/hotspare/SRC/configs/'
  def sql_sites
    arr = []
    sites.each do |x|
      arr << CONFIGS + x + '/DBSCRIPTS'
    end
    return arr
  end

  def sites
    return %w{NH MA CT VT ME}
  end

  def databases
    return %w(dispatch_production dispatch_sutton dispatch_ct dispatch_vt dispatch_me)
  end

  def users
    pass_word = "123ross321"
    arr = []
    arr << {:usr=>"nhuser",:pw=>pass_word}
    arr << {:usr=>"mauser",:pw =>pass_word}
    arr << {:usr=>"ctuser",:pw=>pass_word}
    arr << {:usr=>"vtuser",:pw=>pass_word}
    arr << {:usr=>"meuser",:pw=>pass_word}
    return arr
    end
  def applications
    return %w(dispatch1-6.exe dispatch1-6a.exe dispatch1-4.exe dispatch1-4.exe dispatch1-4.exe)
  end

  class Backup

    def get_files
      Dir.chdir(BACKUP_FOLDER)
      return Dir.glob('*')
    end
  end
end
