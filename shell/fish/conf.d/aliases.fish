alias ll='ls -altr'
alias vi=vim

function findin;
   set file $argv[1]
   set --erase argv[1]
   find -name "*$file" -print0  | xargs -0 grep $argv
end

