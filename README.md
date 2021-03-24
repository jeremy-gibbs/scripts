# Scripts

Collection of various utility scripts.


## mhl

Highlight patterns in different colors.  

Content that is piped through mhl will have the command line argument pattern(s) highlighted in different colors.
Used similarly to grep, but when searching for multiple string and/or the context of non-matching lines is needed.

For example `cat ~/.bashrc | mhl source export alias` will print the entire contents of the file with the words "source" "export" "alias" highlighted in different colors
