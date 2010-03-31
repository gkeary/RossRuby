# This is a Rakefile that would live in the root folder for any package
# that follows the Scripting for Testers conventions. You should not need
# to edit it.

$started_from_rakefile=true

require 'pathname'
PACKAGE_ROOT = Dir.pwd
puts PACKAGE_ROOT
$:.unshift("#{PACKAGE_ROOT}/lib")
puts PACKAGE_ROOT
require 'lib/rossruby/third-party/s4t-utils/load-path-auto-adjuster'
puts PACKAGE_ROOT

require 's4t-utils'
include S4tUtils

# The following two lines are used to tell generic Rake tasks about
# this particular project. If you installed using the s4t-utils
# installation tool, they should have already been set correctly. 

MyFileSystemName='rossruby'  # No ".rb" extension.
MyModuleName='Ross'


# These are the Ruby files 'rake rdoc' searchs for documentation.
# The following includes all ruby files except for third-party
# libraries. Change at will.

MyRdocFiles = FileList.new("lib/rossruby.rb",
                           "lib/rossruby/**/*.rb").exclude("**/third-party/**")


require 's4t-utils/rakefile-common'

