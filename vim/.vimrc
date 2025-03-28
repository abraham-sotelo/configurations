set number

" Insert mode = blinking bar
let &t_SI = "\e[5 q"

" Normal mode = steady block
let &t_EI = "\e[2 q"

" Replace mode = blinking block
let &t_SR = "\e[1 q"

" Restore blinking block at exit
let &t_te .= "\e[1 q"
