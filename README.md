# init Vdebug
Painless set up and initialisation of [Vdebug](https://github.com/vim-vdebug/vdebug) with a key press.

## Usage
In normal mode type `<Leader>d` to initialise the debugger for Python3 with the file currently being edited.

Using a command to start the debugger with Python3 or Python2.
```vim
:DebugPy3 ./project/main.py --arg 1
:DebugPy2 ./project/main.py --arg 1
```

## Install 
For vim-plug
```vim
Plug 'vim-vdebug/vdebug'
Plug 'superDross/init-vdebug', { 'do': 'bash install.sh' }
```
