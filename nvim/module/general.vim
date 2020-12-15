"English spelling checker.
setlocal spelllang=en_us

filetype plugin on

"Some additional syntax highlighters.
au! BufRead,BufNewFile *.wsgi setfiletype python
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.scss setfiletype scss
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.less setfiletype less

au FileType make   setl ts=4 sw=4 sts=4 noet
au FileType rst    setl spell
au FileType gitcommit setl spell
