```shell
# Path to your oh-my-zsh installation.
export ZSH=""
ZSH_THEME=""
DISABLE_AUTO_UPDATE="true"
export NODE_PATH=""
export GOPATH=""
export PGDATA=""
export PATH=""
export HOMEBREW_GITHUB_API_TOKEN=""
eval "$(gdircolors ~/.dir_colors)"
export fdk="/Users/localUser/bin/FDK/Tools/osx"
# To use Homebrew's directories rather than ~/.pyenv add to your profile:
export PYENV_ROOT=/usr/local/var/pyenv
# To enable shims and autocompletion add to your profile:
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
#
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
#
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
#
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
#
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
#
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="false"
#
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
#
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"
HIST_SAVE_NO_DUPS="true"
HIST_IGNORE_SPACE="true"
#
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails
#  textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git wd colored-man-pages npm osx pep8 pyenv copydir copyfile brew)
# User configuration
#
# export MANPATH="/usr/local/man:$MANPATH"
#
source "$ZSH/oh-my-zsh.sh"
#
# You may need to manually set your language environment
export "LANG=en_US.UTF-8"
#
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
#
# Compilation flags
export ARCHFLAGS="-arch x86_64"
#
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
chpwd() {
  print '\n';
  gls -hFXCN --color=auto --group-directories-first;
  print '\n';
}
#
export EDITOR='subl -n -w'
#
fpath=(/usr/local/share/zsh-completions $fpath)
#
autoload -Uz compinit
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# GLS & LISTING
# -----------------------------------------------------
# alias psql-load="launchctl load '/usr/local/Cellar/postgresql/9.4.5_2/homebrew.mxcl.postgresql.plist'"
alias lsdu=" gdu -sh * | gsort -rh"
alias gl=" gls -h1AFXN --group-directories-first --color=auto"
alias glc=" gls -hFXCN -t -q --group-directories-first --color=always"
alias glctime=" gls -hAFXCtc -h -A --group-directories-first --color=auto"
alias gld=' gls "$(pwd)"/*'
alias gla=" gls -1hAXF --group-directories-first --color=auto"
alias gll=" gls -lAFh -N --group-directories-first --color=auto"
alias glr=" gls -lAFhXR --group-directories-first --color=auto"
alias glatime=" gls -ltu -h -A --time-style=long --color=auto"
alias glmtime=" gls -ltc -h -A --time-style=long --color=auto"
alias gmtime=" gls -l -h -Gg -A --time-style=long --color=auto"
# -----------------------------------------------------
# LIST MANUALS INSIDE MODMAN
# -----------------------------------------------------
alias lsdisk="diskutil list"
alias lsusers="dscl . -list /Users PrimaryGroupID | grep [gid]"
alias lslaunchd="sudo launchctl list"
alias lsopencaches="lsof | grep /Library/Caches"
function ddomains() { defaults domains | tr "[:blank:]" '\n';}
# COMPGEN
alias lsalias=" compgen -a"
alias lsallcommands=" compgen -c"
alias lsbuiltins=" compgen -b"
alias lsexportedvariables=" compgen -e"
alias lsreservedwords=" compgen -k"
alias lsvariables=" compgen -v"
alias lssysinfo=" system_profiler -detailLevel mini"
# -----------------------------------------------------
# UTILITY
# -----------------------------------------------------
alias cpl=" tr -d '\n' |pbcopy" # pwd | cpl ==> copy current line
alias editdircolors=" sudo nano /etc/DIR_COLORS"
# alias firefox=" /Applications/Firefox.app/Contents/MacOS/firefox-bin -p"
alias flinks=" find -L . -type l" # find broken symlinksq
alias ram=" sudo purge"
alias rmflashcookies=" rm -rf /Users/localUser/Library/Preferences/Macromedia/Flash\ Player/#SharedObjects"
alias dsed=" sed '/^$/d;G'"
alias editz=" subl ~/.zshrc"
alias viewsyslog=" tail -f /var/log/system.log"
# -----------------------------------------------------
# SPECIAL
# -----------------------------------------------------
alias tpr=" tput rmam"
alias tps=" tput smam"
alias mod_uuid=" dsmemberutil getuuid -U localUser"
alias mod_mountimage=" hdutil attach"
alias gack=" ack -i --color-filename=yellow --color-match=red"
alias viewsyslogboot=" syslog -w 'boot' | sed 's/localUser.local/localUsermac/g' | cut -c 17-"
alias mod_checksecuritystatus=" spctl --status"
alias mod_clear_icloud=" ubcontrol --reset"
alias mod_clear_privacy=" tccutil reset"
alias mod_clear_fonts-cache="sudo atsutil databases -remove"
alias mod_clear_quicklook=" qlmanage -r"
alias mod_clear_quicklookcache=" qlmanage -r cache"
alias mod_clear_spotlightstores=" sudo mdutil -Ea"
alias mod_rebuilddyldcache=" sudo update_dyld_shared_cache -debug -sort_by_name -universal_boot -force"
alias mod_rebuildkextcache=" sudo kextcache -system-caches"
alias mod_rebuildprelinkedcache=" sudo kextcache -system-prelinked-kernel"
alias mod_rebuildxpccache=" sudo /usr/libexec/xpchelper --rebuild-cache --debug"
alias mod_statbootcache=" sudo bootcachecontrol statistics print"
alias mod_verifyicc=" sudo find . -name *.icc -exec sips --verify {} \;" #first "cd /" then run alias
alias view_allusers=" dscl . readall /users"
alias view_groups=" dscacheutil -q group"
#---------------------------------------------------------------
# FUNCTIONS
#---------------------------------------------------------------
 echoman() {
    echo "$(man $1 |col -bx)" >/Users/localUser/Documents/modman/"$1".mmd && subl /Users/localUser/Documents/modman/"$1".mmd
}
 lstar() {
    tar -tvf "$1"
}
#
dircount() {
    find . -type f | egrep -i -E -o "\.{1}\w*$" | sort | uniq -c
}
# FIND UTILITIES
# find any in, highlight:

ff() {
    find . -iname "*$**" -not -path "*/node_modules/**" -not -path "*/bower_components/**"|ack --passthru "$1"
}


fft() {
  find . -iname "*$**" -not -path "*/node_modules/**" -not -path "*/bower_components/**"| while read line; do echo "$(gstat -c "%Y %p %u %g" $line), $line"; done|sort|ack --passthru "$1"
}
# function sudoff() { find . -iname "*$1*" 2>/dev/null | gegrep -Ei -e "^|$1" --color=auto ; }
# function ffe() { sudo find . -iname "$1" 2>/dev/null | gegrep -ie ^|"$1" --color=auto ;  }
# function ffl() { sudo find "$(pwd)" -iname "*$1*" 2>/dev/null -exec gls -l --color=auto '{}' \;  }
# function ffd() { sudo find . -type d -depth 2 -iname "*$1*" -exec gls -d --color=always {} \; |gack "$1" --passthru  }
# function modffexec() { sudo find "$(pwd)" -type f -iname "$1" -exec "$2" '{}' \; }
# function modfindbasename() { sudo find "$(pwd)" -iname "$1" -exec basename '{}' \;  }
# function modfinddot() { sudo find . -iname "$1" ;}
# function modfinddotbname() { sudo find . -iname "$1" -exec basename '{}' \; }
function mktar() { gtar -cpvzf "$2" "$1" ;} ## gtar "SOURCE" "NAME"
# alias mktaru=" echo 'sudo gtar -cpvzf [source] [name]'"
# function modprintDateAdded() { mdls -name kMDItemDateAdded -raw "$1"}
# function modsetdate() { sudo SetFile -d "$(gdate '+%m/%d/%y %H:%M:%S')" "$1" ; }
# function show() { gll "$1" ; shift ; }
# function showall() { cd "$1" && gls -AR ; cd - 1>/dev/null || exit; }
# function hl() { gegrep -ie ^|"$1" --color=auto ;}
# function hlonly() { gegrep -ie "$1" --color=auto ;}
function ff-filetypes() { find . -type f -exec basename '{}' \; | egrep -E -o "\.{1}\w*(-)?(\w*)$" | sort -u }
#----------------------------------------------------
# TREE
# ---------------------------------------------------
# alias mtop=" top -o cpu -n 10 -a"
# alias mdu=" sudo gdu -d 1 -h | gsort -h"
# alias gopath=" cpath ; osascript /Users/localUser/Library/Application\ Scripts/gpathscript.scpt ; "
#----------------------------------------------------
# GIT
# ---------------------------------------------------
alias gsbc=" git show-branch --current"
alias gconfig=" git config --list"
alias ghelp=" git config help"
alias gfrom=" git config --get remote.origin.url"
# alias gst=" git status"
alias grao=" git remote add origin"
alias grso=" git remote show origin"
alias grecent=" git recent -a"
alias gitrel=" git relation $1 $2"
alias grmcached="git rm -r --cached ."
alias gadot="git add ."
alias grmig="git ls-files --ignored --exclude-standard | xargs git rm --cached"
# alias lsdate=" gdate '+%m/%d/%y %H:%M:%S'"
#---------------------------
# NPM
#---------------------------
alias npmlsg=" npm list -g --depth=0;"
alias npmls=" npm ls --depth=0"
alias npmlsold=" npm outdated --depth=0;"
alias npmlsgold=" npm outdated -g --depth=0;"
alias npmlsconfig=" npm config ls -l"
alias npmconfedit=" npm config edit"
alias npmconfeditg=" npm config edit --global"
alias exdebug=" DEBUG=express:* nodemon www"
alias npmconfgetprefix=" config get prefix"
alias npmprune=" npm prune"
alias cdnpm=" cd /usr/local/Lib/node_modules"
alias cdnpmbin=" cd /usr/local/bin"

function closure-lint() {
    find . -path "./node_modules/**" -prune -o -path "./.git" -prune -o -print -iname "*.js" -exec gjslint --disable '0002, 0131, 0001, 0010' -e="node_modules, .git, jsondata" --nojsdoc '{}' \;
}
#---------------------------
# TREE
#---------------------------
alias t=" tree -A -L 1 -I 'bower_components|node_modules' --dirsfirst --noreport"
alias t2=" tree -A -L 2 -I 'bower_components|node_modules' --dirsfirst --noreport"
alias t3=" tree -A -L 3 -I 'bower_components|node_modules' --dirsfirst --noreport"
alias td=" tree -A -f -d -L 1 -A -I 'bower_components|node_modules' --noreport"
alias td2=" tree -A -f -d -L 2 -I 'bower_components|node_modules' --noreport"
alias td3=" tree -A -f -d -L 3 -I 'bower_components|node_modules' --noreport"
alias td4=" tree -A -f -d -L 4 -I 'bower_components|node_modules' --noreport"
alias tf=" tree -A -I 'node_modules|bower_components' --timefmt=%F --dirsfirst --noreport"
alias tsize=" tree -A -L 1 -h -I 'node_modules|bower_components' --dirsfirst --du --sort=size"
alias tmtime=" tree -A -L 1 -D -r --sort=mtime --timefmt=%F --noreport"
alias tctime=" tree -A -L 1 -D -r --sort=ctime --timefmt=%F --noreport"
# function setcom() {setfcomment -c "$1" -c $2}
tfind() {
  tree -f -P "*$**" --prune
}
tfindt() {
  tree -f -P "*$**" --sort=mtime --timefmt=%F --prune
}
# #time=$(gdate +%m%d%y-%H%M%S-) ;
# alias checkdylib=" otool -L **/**.dylib|sed '/^$/d;G'"
# alias hash=" hash|gsed -r 's/=/\n /g'|gack '^\w+' --passthru"
# alias mmv='noglob zmv -W'
# alias pk=" pidof -k"
# com.apple.apsd.launchd
# com.apple.security-common.plist
# find . -type l -xtype l
# find . -type l | xargs file | grep broken
# fn() { print -z print The time now is $(date); }
# mount|gegrep -E "\s/.*\b\s" --color


# sudo cat /etc/passwd |egrep -E "\d+" --color
# sudo gfind '/usr/local' -exec gstat -c "%a-%u-%g %N" '{}' \+ >files.txt;
# tree -a -R -P "*Default*" -f --prune|ack Default --passthru
##id -Gn|tr ' ' '\n'
alias fixjs=" fixjsstyle --nojsdoc"
alias gitlg3=" tpr; git lg3; tps"
alias lsdotfiles='find . -type f -maxdepth 1 -name "*\.*"'
alias mdv='~/Documents/gschool/dev-tools/github-clones/mdv/mdv.py -t random'
alias modbrewlist=" brew list|tr -s ' ' '\n'| while read line; do brew info $line; done"
alias modmongo=" mongod --config /usr/local/etc/mongod.conf"
alias modpid=" ps -axc -o pid -o comm|sort -k 2|gack $1"
alias npmls=" npm ls -depth=0"
alias prettypath=" sed 's/\//  /g'"
alias rh=" rehash"
alias short=" sed 's/\(.\{1,200\}\).*/\1/'"
alias ta='t -a -L 1'
alias tdf=" tree -A -f -d -I 'bower_components|node_modules|tmp' --noreport"
alias termreset=" ttyctl -f"
alias tmtimel=" tmtime -ugpA"
alias wdl=" wd list|sort -k 3"
alias dv=" dirs -v"
ffiname() {
  find . -iname "*$**"
}
wdp() {
  wd path "*$**"
}
pathfinder() {
    cpath
    osascript /Users/localUser/Library/Application\ Scripts/gpathscript.scpt
}

# highlight
hl() {
 gls -hFXCN -q --group-directories-first --color=always|gack "$1" --passthru;
}

# highlight only
hlo() {
 gls -hFX1N -q --group-directories-first --color=always|gack "$1";
}

# reset terminal
alias zr=" termreset"

# substitute blanks
alias trblanks='tr -s "[[:blank:]]"'

# open zhsrc with sublime
alias sublz=" subl ~/.zshrc"

# find directory
ffd() {
    find . -type d -iname "*$**" -not -path "*/node_modules/**" -not -path "*/.apm/**" -not -path "*/npm/**" -not -path "*/bower_components/**"|ack --passthru "$1"
}

# open nwjs application with debug port on
alias nwjs="/Applications/nwjs.app/Contents/MacOS/nwjs --remote-debugging-port=9222"

# source z
alias srz=" source ~/.zshrc"

# search history and highlight
hisgack() {
  history|ack "$1"|cut -c 25-|sort -u|dsed|ack "$1"
}

# make a tarball
alias gettar=" gtar -xf $1 $2"

# ls and printlines
alias glx=" print '\n'; glc -X; print '\n'"

# pretty print aliases
alias palias='alias|gack "(^\w+)(-)?(_?)(\w+)?" --passthru'

# pretty print env
alias penv='env|short|dsed|gack "^\w+" --passthru'

# HISTORY IGNORE ZSH
alias cat=" cat"
alias git=" git"
alias his='history|cut -c 25-|dsed'
alias ls=' ls'
alias subl=' subl'
alias echo=' echo'
alias getall='wget -E -H -k -K -p $1'
alias cd=" cd"
alias man=" man"
alias mv=" mv"
alias brew=" brew"
alias wd=" wd"
alias source=" source"
alias qmv='qmv --format=do'
alias electron="/Users/localUser/bin/Electron.app/Contents/MacOS/Electron $1"
alias zman="MANWIDTH=80 MANPAGER=col -bx "$1" rev-parse | subl"
alias grmca
```
