dotvim
======

My `.vim` directory!

Clone it into `.vim` folder:
```vim
git clone --recursive git@github.com:stocarul/dotvim.git .vim
```

Add to `~/.vimrc`:
```vim
source ~/.vim/vimrc
```

Install bundles:
```vim
vi ~/.vim/vimrc
:BundleInstall
```

Required commands:

- [ctags](http://ctags.sourceforge.net)
- [ack-grep](http://beyondgrep.com/install)
- [jshint](https://github.com/jshint/jshint)
- [redcarpet](https://github.com/vmg/redcarpet)
- Python libraries:
  - [Pillow](https://github.com/python-pillow/Pillow)

Create tags files in every project:
```shel
#for vendors
ctags -R --languages=php \
--PHP-kinds=+cf \
--regex-PHP="/trait ([^ ]*)/\1/c/" \
-f tags.vendors vendor

#for sources
ctags -R --languages=php \
--PHP-kinds=+cf \
--regex-PHP="/trait ([^ ]*)/\1/c/" \
--exclude=.git \
--exclude=app \
--exclude=vendor \
--exclude=bin \
--exclude=web \
.
```
