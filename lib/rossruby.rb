# Require external libraries (whether in third-party or site_ruby) here:
require 's4t-utils'

# Require all library files in this package here:
require 'lib/rossruby/version'
require 'bin/drive_map'
# require 'rossruby/another-file'

# Any comments written here will become
# the documentation for Ross.
# That will be the first page shown when you 
# create the HTML documentation.
module Ross
  BACKUP_FOLDER = 'C:/hotspare/backup/'
  APP_ROOT = 'C:/hotspare/SRC/'
  CONFIGS = 'C:/hotspare/SRC/configs/'


  ## TODO:  make sense of these mixin methods
  ## TODO:  mske sense of the tests
  #@ TODOS: move class BAckup into its own file and refactor
  ###TODO:  make a test all boxes --using test_mapt_to_woody...
  ###
  #
  # keep it Green .....

  ## todo: make a script which pulls one and/or all of the back files over here....

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

  def user_array
    pw = '123ross321'
    u = [ {:k=>'NH',:usr=>'nhuser',:pw=>pw,:ip=>'192.168.1.89'},
          {:k=>'MA',:usr=>'mauser',:pw=>pw,:ip=>'192.168.2.89'},
          {:k=>'VT',:usr=>'vtuser',:pw=>pw,:ip=>'192.168.3.89'},
          {:k=>'CT',:usr=>'ctuser',:pw=>pw,:ip=>'192.168.4.89'},
          {:k=>'CT1',:usr=>'ctuser',:pw=>pw,:ip=>'192.168.1.23',:ip1=>'75.149.140.61',:ts=>'RossTS'},          
          {:k=>'ME',:usr=>'meuser',:pw=>pw,:ip=>'192.168.5.89'}
        ]
    return u
  end
   class Backup

    def get_files
      Dir.chdir(BACKUP_FOLDER)
      return Dir.glob('*')
    end
  end
end
