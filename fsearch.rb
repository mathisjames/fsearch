#!/usr/bin/ruby -w

#
# James L Mathis
#
# Project: Recursive directory displayer 
#
# Version: 1.0
#

#-----------------------------------------------------------------------------#
# Global #
#-----------------------------------------------------------------------------#
$directory_path = "" # save if we need to use later #

#-----------------------------------------------------------------------------#
# Subroutines #
#-----------------------------------------------------------------------------#

#------------------#
# Read Directories #
#------------------------------------#
def read_directory(dir_path)

	# check to see if this is a directory #
	if !File.directory? dir_path
		# display error information #
		puts "Error opening directory: #{dir_path}\n"
		# exit #
		return
	end

	# loop through directory entries #
	Dir.foreach(dir_path) {
		# assign entry #
		|f|
		# check if its directory shorts #
	        if f != "." and f != ".."
			# check if this is a sub directory #
			if File.directory? dir_path + "/" + f + "/"
				# sub directory - change and display entries #
				puts "Directory: #{dir_path}/#{f}"
				read_directory(dir_path + "/" + f) 
			else
				# file - display name of file #
				puts "File: #{f}"
			end
		end
	}

end


#-----------------------------------------------------------------------------#
# Mainloop #
#-----------------------------------------------------------------------------#

# get directory path we want to view #
$directory_path = ARGV[0]

# check to see if we added a path #
if($directory_path == nil)
	# display usage information #
	print "Usage: fsearch directory\n"
else 
	# read directory content #
	read_directory($directory_path)

end

