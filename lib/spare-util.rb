# Require external libraries (whether in third-party or site_ruby) here:
require 's4t-utils'

# Require all library files in this package here:
#require 'spare-util/version'
# require 'spare-util/some-file'
# require 'spare-util/another-file'

# Any comments written here will become
# the documentation for SpareUtil.
# That will be the first page shown when you 
# create the HTML documentation.
module SpareUtil

    BACKUP_FOLDER = 'C:/hotspare/backup/'
    APP_ROOT = 'C:/hotspare/SRC/'
    CONFIGS = 'C:/hotspare/SRC/configs/'


  ## TODO:  make sense of these mixin methods
  ## TODO:  make sense of the tests
  #@ TODO: move class Backup into its own file and refactor
  ###TODO:  make a test all boxes --using test_mapt_to_woody...
  ###
  #
  # keep it Green .....

  ## todo: make a script which pulls one and/or all of the back files over here....

  def db_script_dirs
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

  def usr_pw_hash
    pass_word = "123ross321"
    arr = []
    arr << {:usr=>"nhuser", :pw=>pass_word}
    arr << {:usr=>"mauser", :pw =>pass_word}
    arr << {:usr=>"ctuser", :pw=>pass_word}
    arr << {:usr=>"vtuser", :pw=>pass_word}
    arr << {:usr=>"meuser", :pw=>pass_word}
    return arr
  end

  def applications
    return %w(dispatch1-6.exe dispatch1-6a.exe dispatch1-4.exe dispatch1-4.exe dispatch1-4.exe)
  end

  def ip_by_site(s)
    ip_str = '192.168.'
      case s
        when 'NH' then ip_str << '1.89'
        when 'MA' then ip_str << '2.89'
        when 'VT' then ip_str << '3.89'
        when 'CT' then ip_str << '4.89'
        when 'ME' then ip_str << '5.89'
      end
    return ip_str
  end

    def user_array
      pw = '123ross321'
      u = [ {:k=>'NH', :usr=>'nhuser', :pw=>pw, :ip=>ip_by_site('NH')},
            {:k=>'MA', :usr=>'mauser', :pw=>pw, :ip=>ip_by_site('MA')},
            {:k=>'VT', :usr=>'vtuser', :pw=>pw, :ip=>ip_by_site('VT')},
            {:k=>'CT', :usr=>'ctuser', :pw=>pw, :ip=>ip_by_site('CT')},
            {:k=>'CT1', :usr=>'ctuser', :pw=>pw,:ip=>ip_by_site('CT'),
                      :ip1=>'75.149.140.61', :ts=>'RossTS'},
            {:k=>'ME', :usr=>'meuser', :pw=>pw, :ip=>ip_by_site('ME') }
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
