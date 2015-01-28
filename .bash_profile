# If not running interactively, don't do anything
# $- : variable saving shell's flags. 
# echo $- himBH : man bash & search for SHELL BUILTIN COMMANDS
# himBH : i interactive
case $- in
    *i*) ;;
      *) return;;
esac

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`
# * ~/.extra can be used for other settings.
# -r -f : man test
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g `**/qux` will enter `./foo/bar/baz/qux`
# * `globstar`, Recursive globbing, e.g. `echo **/*.txt`
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done
