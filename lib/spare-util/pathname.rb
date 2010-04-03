# If this is a directory, returns the most recently modified
# file in this directory. Otherwise, return itself. If _matching_
# is specified, only return files where filename =~ _matching_.
#
# Returns nil if no files (or no matching files) are found.
class Pathname
    def most_recent_file(matching=/./)
      #puts "Pathname inspect: #{self.inspect}"
      return self unless self.directory?
      files = self.entries.collect { |file| self+file }.sort { |file1,file2| file1.mtime <=> file2.mtime }
      files.reject! { |file| ((file.file? and file.to_s =~ matching) ? false : true) }
      files.last
    end
end