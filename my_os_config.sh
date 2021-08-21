#! /bin/zsh

# This script automatically configures OS settings - use with care!
# Remember to chmod 755 this

# Find domain with text_string name that you are interested in
# defaults domains | tr ',' '\n' | grep text_string

# Pick domain that you are interested (e.g. com.apple.TextEdit) and read it to
# retrieve a dictionary data structure. Keys are strings (and might not be there
# if the value has not changed from the system default), but values could be
# many data types.
# default read com.apple.TextEdit

# Write the option <somewhere> so that you can compare it later
# Now manually change the option
defaults read com.apple.dock orientation
