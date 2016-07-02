export ZSH="/User/Path/.oh-my-zsh"
export LANG="en_US.UTF-8"
export electron="/User/Path/.electron/Electron.app/Contents/MacOS/Electron"
####################################
JENV_ROOT="/User/Path/.jenv"
JENV_BIN="/User/Path/.jenv/bin"
####################################
PYENV_ROOT="/User/Path/.pyenv"
PYENV_BIN="/User/Path/.pyenv/bin"
####################################
RBENV_ROOT="/User/Path/.rbenv" # echo $RBENV_ROOT
RBENV_BIN="/User/Path/.rbenv/bin" # echo $RBENV_BIN
####################################
# POSTGRES
PSQL_BIN="/Applications/Postgres.app/Contents/Versions/latest/bin"
PGDATA="/User/Path/Library/Application Support/Postgres/var-9.5"
# OPBIN
OPBIN="/User/Path/bin"
# GOBIN
GOBIN="/usr/local/opt/go/libexec/bin"
GOPATH="/User/Path/bin/go"
# NODE
export NPM_GLOBAL="/User/Path/.npm-global"
export PREFIX="/User/Path/.npm-global"
export N_PREFIX="/usr/local"
export NODE_PATH="/User/Path/.npm-global/lib/node_modules"
export NPM_CONFIG_PREFIX="~/.npm-global"
export NODE_ENV="development"
export PATH='/usr/local/bin/git:/User/Path/.pyenv/shims:/User/Path/.pyenv/plugins/pyenv-virtualenv/shims:/User/Path/.pyenv/bin:/User/Path/.rbenv/shims:/User/Path/.rbenv/bin:/User/Path/.npm-global/bin:/User/Path/.jenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/lib:/User/Path/Library/Application Support/Postgres/var-9.5:/User/Path/bin:/usr/local/opt/go/libexec/bin'
export git='/usr/local/bin/git'
fpath=(/usr/local/share/zsh-completions $fpath)
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
if [ -n "$PATH" ]; then
  old_PATH=$PATH:; PATH=
  while [ -n "$old_PATH" ]; do
    # first remaining entry
    x=${old_PATH%%:*}
    case $PATH: in
      *:"$x":*) ;;
      *) PATH=$PATH:$x;;
    esac
    old_PATH=${old_PATH#*:}
  done
  PATH=${PATH#:}
  unset old_PATH x
fi
export DISABLE_AUTO_UPDATE="true"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export plugins=(git wd osx copyfile brew npm node)
if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
export ZSH_THEME="Agnoster"
eval "$(gdircolors ~/.dircolors)"
source "$ZSH/oh-my-zsh.sh"
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' completions g
zstyle ':completion:*' glob g
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' original true
zstyle ':completion:*' substitute 0
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/User/Path/.zshrc'
source "$ZSH/oh-my-zsh.sh"
export MAILCHECK=0
export EDITOR='subl -a -w'
export DISABLE_UNTRACKED_FILES_DIRTY="true"
export HIST_STAMPS="mm/dd/yyyy"
export HIST_SAVE_NO_DUPS="true"
export HIST_IGNORE_SPACE="true"
export ARCHFLAGS="-arch x86_64"
export MONITOR="true"
source '/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
function chpwd(){
  echo '\n' ;
  gls -hFXCNA -t -q --group-directories-first --color=auto ;
  echo '\n' ;
}
# aliases
alias mdv="/User/Path/bin/terminal_markdown_viewer/mdv.py"
alias ..="cd .."
alias canary-debug="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222"
alias clear_ram=" sudo purge"
alias cpl=" tr -d '\n' |pbcopy" # pwd | cpl ==> copy current line
alias dsed=" sed '/^$/d;G'"
alias dv=" dirs -v"
alias editdircolors=" sudo nano /etc/DIR_COLORS"
alias editz=" subl ~/.zshrc"
alias exdebug="DEBUG=express:* nodemon $1"
alias fixjs=" fixjsstyle --nojsdoc"
alias flinks=" find -L . -type l" # find broken symlinksq
alias g-stash-branch="git stash branch $1"
alias g-stash=" git stash save -a"
alias g-stashl=" git stash list"
alias gack="ack -i "$1" --color-filename=yellow --color-match=red"
alias gadot="git add ."
alias gconfig=" git config --list"
alias gettar=" gtar -xf $1 $2"
alias gfrom=" git config --get remote.origin.url"
alias ghelp=" git config help"
alias gitlg3=" tpr; git lg3; tps"
alias gitlsf="git lsf|cut -c 51-"
alias gitrel=" git relation $1 $2"
alias gfp="git fetch -p"
alias gl1="gls -1hAXF --sort='extension' --color --group-directories-first"
alias gla=" gls -1hAXF --group-directories-first --color=auto"
alias glatime=" gls -ltu -h -A --time-style=long --color=auto"
alias glc=" gls -hFXCNA -t -q --group-directories-first --color=always"
alias glctime=" gls -hAFXCtc -h -A --group-directories-first --color=auto"
alias gld=' gls "$(pwd)"/*'
alias gle="echo; gls  -Q -C -A -I 'Icon*' --sort='extension' --color=auto; echo ;"
alias gll=" gls -lAFh -N --group-directories-first --color=auto"
alias glmtime=" gls -ltc -h -A --time-style=long --color=auto"
alias glr=" gls -lAFhXR --group-directories-first --color=auto"
alias glx=" print '\n'; glc -X; print '\n'"
alias gmtime=" gls -l -h -Gg -A --time-style=long --color=auto"
alias google-clean="ls -1| gack -vi 'google|chrome' |while read line; do trash $line; done"
alias google-debug="/User/Path/Applications/Chrome49.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias grao=" git remote add origin"
alias grecent=" git recent -a"
alias grmcached="git rm -r --cached ."
alias grmig=" git ls-files --ignored --exclude-standard | xargs git rm --cached"
alias grso=" git remote show origin"
alias gsbc=" git show-branch --current"
alias gview-conflict="git ls-files -u"
alias gview-ignore="git ls-files --exclude-standard -o -i"
alias gview-index="git ls-files -s"
alias gview-mod="git ls-files -d -m"
alias gview-other="git ls-files -o"
alias gview-untracked="git ls-files --exclude-standard -o"
alias lsalias=" compgen -a"
alias lsallcommands=" compgen -c"
alias lsbuiltins=" compgen -b"
alias lsdisk="diskutil list"
alias lsdotfiles='find . -type f -maxdepth 1 -name "*\.*"'
alias lsdu=" gdu -sh * | gsort -rh"
alias lsexportedvariables=" compgen -e"
alias lslaunchd="sudo launchctl list"
alias lsopencaches="lsof | grep /Library/Caches"
alias lsreservedwords=" compgen -k"
alias lssysinfo=" system_profiler -detailLevel mini"
alias lsusers="dscl . -list /Users PrimaryGroupID"
alias lsvariables=" compgen -v"
alias mod_checksecuritystatus=" spctl --status"
alias mod_clear_fonts-cache="sudo atsutil databases -remove"
alias mod_clear_icloud=" ubcontrol --reset"
alias mod_clear_privacy=" tccutil reset"
alias mod_clear_quicklook=" qlmanage -r"
alias mod_clear_quicklookcache=" qlmanage -r cache"
alias mod_clear_spotlightstores=" sudo mdutil -Ea"
alias mod_mountimage=" hdutil attach"
alias mod_rebuilddyldcache=" sudo update_dyld_shared_cache -debug -sort_by_name -universal_boot -force"
alias mod_rebuildkextcache=" sudo kextcache -system-caches"
alias mod_rebuildprelinkedcache=" sudo kextcache -system-prelinked-kernel"
alias mod_rebuildxpccache=" sudo /usr/libexec/xpchelper --rebuild-cache --debug"
alias mod_statbootcache=" sudo bootcachecontrol statistics print"
alias mod_uuid=" dsmemberutil getuuid -U Op"
alias mod_verifyicc=" sudo find . -name *.icc -exec sips --verify {} \;" #first "cd /" then run alias
alias modbrewlist=" brew list|tr -s ' ' '\n'| while read line; do brew info $line; done"
alias modmongo=" mongod --config /usr/local/etc/mongod.conf"
alias modpid=" ps -axc -o pid -o comm|sort -k 2|gack $1"
alias npmconfedit="npm config edit"
alias npmconfeditg="npm config edit --global"
alias npmconfgetprefix=" config get prefix"
alias npmls="npm ls --depth=0"
alias npmls="npm ls -depth=0"
alias npmlsconfig="npm config ls -l"
alias npmlsg="npm list -g --depth=0;"
alias npmlsgold="npm outdated -g --depth=0;"
alias npmlsold="npm outdated --depth=0;"
alias npmprune=" npm prune"
alias nwjs="/Applications/nwjs.app/Contents/MacOS/nwjs --remote-debugging-port=9222"
alias palias='alias|gack "(^\w+)(-)?(_?)(\w+)?" --passthru'
alias penv='env|short|dsed|gack "^\w+" --passthru'
alias prettypath=" sed 's/\//  /g'"
alias qmv='qmv --format=do'
alias rh=" rehash"
alias rmflashcookies=" rm -rf /User/Path/Library/Preferences/Macromedia/Flash\ Player/#SharedObjects"
alias short=" sed 's/\(.\{1,200\}\).*/\1/'"
alias sourcez=" source ~/.zshrc"
alias sublz=" subl ~/.zshrc"
alias t2=" tree -A -L 2 -I 'bower_components|node_modules' --dirsfirst --noreport"
alias t3=" tree -A -L 3 -I 'bower_components|node_modules' --dirsfirst --noreport"
alias t=" tree -A -L 1 -I 'bower_components|node_modules' --dirsfirst --noreport"
alias ta='t -a -L 1'
alias tctime=" tree -A -L 1 -D -r --sort=ctime --timefmt=%F --noreport"
alias td2=" tree -A -f -d -L 2 -I 'bower_components|node_modules' --noreport"
alias td3=" tree -A -f -d -L 3 -I 'bower_components|node_modules' --noreport"
alias td4=" tree -A -f -d -L 4 -I 'bower_components|node_modules' --noreport"
alias td=" tree -A -f -d -L 1 -A -I 'bower_components|node_modules' --noreport"
alias tdf=" tree -A -f -d -I 'bower_components|node_modules|tmp' --noreport"
alias termreset="hash && ttyctl -f && compinit"
alias tf=" tree -A -I 'node_modules|bower_components' --timefmt=%F --dirsfirst --noreport"
alias tmtime=" tree -A -L 1 -D -r --sort=mtime --timefmt=%F --noreport"
alias tmtimel=" tmtime -ugpA"
alias tpr=" tput rmam"
alias tps=" tput smam"
alias trblanks='tr -s "[[:blank:]]"'
alias ts="source /User/Path/.oh-my-zsh/themes/agnoster-short.zsh-theme"
alias tsize=" tree -A -L 1 -h -I 'node_modules|bower_components' --dirsfirst --du --sort=size"
alias view_allusers=" dscl . readall /users"
alias view_groups=" dscacheutil -q group"
alias viewsyslog=" tail -f /var/log/system.log"
alias viewsyslogboot=" syslog -w 'boot' | sed 's/'COMPUTER NAME'/opmac/g' | cut -c 17-"
alias wdl=" wd list|sort -k 3"
alias tmux='TERM=xterm-256color \tmux'



#FUNCTIONS
# PEP8 REBUILD... HARD
function pephard(){
  autopep8 --in-place --aggressive "$1"
}

# touchit, makeit, pasteit
function paste_make() {
  touch $1;
  echo "$(pbpaste)" > $1;
}

# quick gl
function gl() {
  echo '\n';
  gls -A -1 --sort="extension" --color;
  echo '\n';
}

# tame closure-linter
function closure_lint() { find . -path "./node_modules/**" -prune -o -path "./.git" -prune -o -print -iname "*.js" -exec gjslint --disable '0002, 0131, 0001, 0010' -e="node_modules, .git, jsondata" --nojsdoc "{}" \; ; }
# quick hl history
function hisgack() { history|ack "$1"|cut -c 25-|sort -u|dsed|ack "$1"; }

# highlight settings
function ddomains() { defaults domains | tr "[:blank:]" '\n' ; }

# find wildcard style
function ffiname() { find . -iname "*$1*"; }

# quick show path
function wdp() { wd path "*$1"; }

# quick copy full path
function wdpath() {
  echo -n "'`wdp $1`'"|pbcopy;
  echo "$(pbpaste)";
}

# rsync backup all
function rsyncall() {
  rsync -avz "$1" "$2" ;
}

# launch pathfinder
function pathfinder() { cpath; osascript /User/Path/Library/Application\ Scripts/gpathscript.scpt ; }

# highlight
function hl() { gls -hFXCN -q --group-directories-first --color=always|gack "$1" --passthru ; }

# highlight only
function hlo() { gls -hFX1N -q --group-directories-first --color=always|gack "$1" ; }

# find dirs
function ffd() {
    find . -type d -iname "*$1*" -not -path "*/.git/**" -not -path "*/node_modules/**" -not -path "*/.apm/**" -not -path "*/npm/**" -not -path "*/bower_components/**"|ack --passthru "$1" ;
}

# find tree
function tfind() {
  tree -f -P "*$1" -I node_modules --prune;
}

# find tree by time
function tfindt() {
  tree -f -P "*$1" --sort=mtime --timefmt=%F --prune;
}

# open man, in sublime, properly formatted
function echoman() {
    echo "$(man $1 |col -bx)" >/User/Path/Documents/modman/"$1".mmd && subl /User/Path/Documents/modman/"$1".mmd
}

# view contents of tarfile
function lstar() {
    tar -tvf "$1"
}

# count files by extension in path
function dircount() { find . -type f | egrep -i -E -o "\.{1}\w*$" | sort | uniq -c ; }

# wildcard find files
function ff() { find . -iname "*$1*" -not -path "*/.git/**" -not -path "*/node_modules/**" -not -path "*/bower_components/**"|ack --passthru "$1" ; }

# wildcard find files, by time
function fft() { find . -iname "*$1" -not -path "*/node_modules/**" -not -path "*/bower_components/**" | while read line; do echo "$(gstat -c "%Y %p %u %g" $line), $line"; done | sort | ack --passthru "$1" --color-filename=yellow --color-match=red; }

# make tarball
function mktar() { gtar -cpvzf "$2" "$1" ; }

# show all filetypes in path
function ff-filetypes() { find . -not -path "*/.git/**" -not -path "*/node_modules/**" -not -path "*/.apm/**" -not -path "*/npm/**" -not -path "*/bower_components/**" -type f -exec basename '{}' \; | egrep -E -o "\.{1}\w*(-)?(\w*)$" | sort -u ; }

# include node modules
function ff-filetypes-modules() { find . -type f -exec basename '{}' \; | egrep -E -o "\.{1}\w*(-)?(\w*)$" | sort -u ; }

# find in history
function hisfind() { history | cut -c 25- | sort -fiu | gack "$1" ; }

# mod uglify
function mugly() { uglifyjs "$1" --compression --lint --acorn --comments=all --unsafe=false --unsafe-comps=false --conditionals=true --comparisons=true --booleans=true --loops=true --unused=false --hoist-funs=true --keep-fargs=true --keep-fnames=true --hoist-vars=false --if-return=true --join-vars=true --collapse-vars=false --cascade --side-effects --pure-getters=false --pure-funcs=null --negate-iife=false --screw-ie8=true --drop-console=false --angular=false --warnings|pbcopy ; }

# view man in sublime, another way
function zman() { MANWIDTH=80 MANPAGER=col -bx "$1" rev-parse | subl ; }

# get website... all of it
function getall() { wget -E -H -k -K -p "$1" ; }

# minimerge the rightway
function mod-mini-merge() {
  filename="$(date '+%Y%m%d-%H%m%S').js";
  java -jar /User/Path/bin/minimerge.jar -s "$1" -o $filename -i .js;
}

# mini merge and uglify
function mod-mini-ugly() {
  filename="$(date '+%Y%m%d-%H%m%S').js";
  java -jar /User/Path/bin/minimerge.jar -s "$1" -o ./mini-merge/$filename -i .js;
  uglifyjs ./mini-merge/$filename -o ./mini-merge/$filename.ugly.js
}

# view plist contents
function plprint() {
  plutil -p "$1";
}

# before I made nodescript
function parseSublime() {
  jq '.[] | if (.args) == null then {(.command): .keys} else {(.command): .keys, args: .args} end' -c default.sublime-keymap
}

# quick view path
function wdp() {
  wd path "$1";
}
function uglifybak() {
  cp "./$1" "./$1.bak" && uglifyjs "./$1" > tmp.js && rm "./$1" && mv tmp.js "./$1" ;
}

# get the pathtofile. escaped properly no quotes
function pathto() {
  echo "`pwd`/$1"|gsed -r 's: :\\ :g' | pbcopy ;
  echo "$(pbpaste)" ;
}

# get path to file... but quoted
function pathtoquote() {
  echo "`pwd`/$1" | gsed -r 's/(.*$)/"\1"/g' | pbcopy ;
  echo "$(pbpaste)" ;
}

# clean package.json
function cleannpmjson() {
  removeNPMAbsolutePaths "$1" ;
}

# another gls shortcut
function g() {
  gls -A --color ;
}

# echo and copy path.
function echopwd() {
  echo -n "$(PWD)" | pbcopy;
  echo "$(pbpaste)";
}

# eslint node-modules
function modeslint(){
  eslint "$1" --ignore-pattern '!node_modules/*'
}

# paste and escape spaces
function pasteescape() {
  $pbpaste | gsed -r 's/ /\\/g';
}

# that script i wrote
alias cleansublime="node /User/Path/Documents/gschool/proj/sublime-settings-clean/index.js"

# path to my themes
alias themes="Packages/User/Themes/mod-monokai-js.tmTheme"
