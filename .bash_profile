# macOS does not call ~/.bashrc by default, place call in ~/.bash_profile instead
if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi
