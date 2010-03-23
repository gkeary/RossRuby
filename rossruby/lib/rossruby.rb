# Require external libraries (whether in third-party or site_ruby) here:
require 's4t-utils'

# Require all library files in this package here:
require 'rossruby/version'
require 'bin/drive_map'
# require 'rossruby/another-file'

# Any comments written here will become
# the documentation for Ross.
# That will be the first page shown when you 
# create the HTML documentation.
module Ross
  def site_array
    return ["NH", "MA", "VT", "CT", "ME"]

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
end
