if !has('python')
	echo 'Error: require vim build with +python'
	finish
endif

if exists('*VithonInit')
	finish
endif

au BufNewFile,BufRead ~/.vithonrc set syntax=python

function VithonInit()
python<<ENDPY
import sys
import os.path
import vim

for x in vim.eval('&runtimepath').split(','):
    path = os.path.join(x, 'python')
    if os.path.exists(path) and path not in sys.path:
        sys.path.append(path)

import vithon
ENDPY
	if filereadable($HOME.'/.vithonrc')
		pyfile $HOME/.vithonrc
	endif
endfunction

call VithonInit()
