# Code Snippets
## VIM
Podemos agregar abreviaturas en nuestro `~/.vimrc` o `/etc/vim/vimrc`
```vim
abbr <shortcut> <string>
abbr _sh #!/bin/bash
```
Podemos colocar nuestros snippets archivos, en un directorio creado especialmente para tal uso.
> $ mkdir -m 700 ~/snippets  # permisos 700 recomendado

Ahora podemos agregarlos a a nuestro código:
```vim
<ESC>
:r ~/snippets/if
```
