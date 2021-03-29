function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end 

function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
   
function fish_user_key_bindings
   # alt-enter to accept and execute current suggestion
   bind \e\r 'commandline -f accept-autosuggestion execute'

   # alt-_ to add the previous commands last argument to the command line
   bind \e_ 'history-token-search-backward'

   bind ! bind_bang
   bind '$' bind_dollar
end

