# ~/.bashrc: executed by bash(1) for non-login shells.
## see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000






# ---------------------- MY ALIASES ---------------------- #



user_win='roman';
user_lin="$(whoami)";
user_mac="$(whoami)";



alias vscode="/mnt/c/Users/$user_win/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"
alias desktop="cd /mnt/c/Users/$user_win/Desktop"
alias downloads="cd /mnt/c/Users/$user_win/Downloads"
alias aerender="/mnt/c/Program\ Files/Adobe/Adobe\ After\ Effects\ 2020/Support\ Files/aerender.exe"
alias ffcountframes="ffprobe -v error -select_streams v:0 -show_entries stream=nb_frames -of default=nokey=1:noprint_wrappers=1"
alias ffcountframesmkv="ffprobe -v error -count_frames -select_streams v:0 -show_entries stream=nb_read_frames -of default=nokey=1:noprint_wrappers=1"
alias editbrc="nano ~/.bashrc"




# function check_dir () {
# 	if [ $PWD == ~ ] || [ $PWD == "/" ]
# 		then 
# 			echo "Incorrect directory. Make sure you've specified the right one";
# 			return 0;
# 	fi;
# }



function windisk () {
	if [ -z $1 ] 
	then
		echo "No dir. example: 'windisk d' — cd /mnt/d (equivalent to D:\\)";
		return 0;
	fi;

	cd /mnt/$1;
}

# function defineWinUserName () {
# 	user_win=$(powershell.exe '$env:UserName');
# 	user_win=$(echo $user_win | sed 's/\r//g');
# }

# function defineLinuxUserName () {
# 	user_lin=$(whoami);
# }

# function defineMacUserName () {
# 	user_mac=$(id -un);
# }

#defineWinUserName;
#defineLinuxUserName;
#defineMacUserName;


# other tools: ffmpeg, exifdata, ssh, netcat, nmap,
alias install_necessary_packages="sudo apt update;
sudo apt install \
npm \
imagemagick \
pngquant \
gifsicle \
zip \
unzip \
cmake \
autoconf \
automake \
libtool \
nasm \
make \
pkg-config \
git \
libpng-dev \
-y;
sudo npm install -g svgo; 
git clone https://github.com/mozilla/mozjpeg.git; 
cd mozjpeg; 
mkdir build && cd build; 
sudo cmake -G'Unix Makefiles' ../;
sudo make install;
sudo ln -sf /opt/mozjpeg/bin/cjpeg /usr/bin/mozjpeg;
sudo ln -sf /opt/mozjpeg/bin/jpegtran /usr/bin/mozjpegtran;"



function update_mac_profiles () { if [[ $PWD == ~ ]]; then if test -f "bashrc"; then cat bashrc | sed -n '/function\ update_mac_profiles/,/#aliases_end#/p' > .zprofile;
			# cp .zprofile .bash_profile;
			echo 'profiles updated!'
		else 
			echo "bashrc not found"
		fi;
	else
		echo "Wrong directory";
	fi;
}






alias install_necessary_packages_mac="brew update;
brew install \
zip \
unzip \
imagemagick \
pngquant \
gifsicle \
mozjpeg \
libpng \
npm;
npm install -g svgo;"








function unzipall () {
	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Incorrect directory. Make sure you've specified the right one";
			return 0;
	fi;
	for f in *.zip; do unzip "$f" -d "${f::-4}"; done; 
}

function zipall () {
	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Incorrect directory. Make sure you've specified the right one";
			return 0;
	fi;

	parentdirname=$PWD; 
	for dirname in */; do dirname=${dirname%*/}; cd "$parentdirname/$dirname"; zip $1 "$dirname.zip" ./*; mv "$dirname.zip" "$parentdirname/"; done; cd "$parentdirname";
};

# image compress 
function svgmin () {
	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Incorrect directory. Make sure you've specified the right one";
			return 0;
	fi;

	if [[ -z $(find . -iname '*.svg') ]]
	then
		echo "There's no SVGs."
		return 0;
	fi;

	find . -iname '*.svg' -exec svgo {} \;
}

function pngmin () {

	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Incorrect directory. Make sure you've specified the right one";
			return 0;
	fi;

	if [[ -z $(find . -iname '*.png') ]]
	then
		echo "There's no PNGs."
		return 0;
	fi;

	local pngquality;
	if [[ -z $1 ]]
	then
		pngquality=100;
		echo "Compressing PNGs with default quality: $pngquality"
	else 
		pngquality=$1;
		echo "Compressing PNGs with custom quality: $pngquality"
	fi;
	find . -iname '*.png' -exec pngquant --verbose --speed 1 --strip --quality=$pngquality -f --ext .png {} \;
}

function jpgmin () {
	
	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Incorrect directory. Make sure you've specified the right one";
			return 0;
	fi;

	if [[ -z $(find . \( -iname '*.jpg' -o -iname '*.jpeg' \)) ]]
	then
		echo "There's no JPGs."
		return 0;
	fi;

	local jpglossy=1;

	if [[ -z $1 ]] 
	then
		jpglossy=75;
		echo "Compressing JPGs with default quality: $jpglossy"
	else
		jpglossy=$1;
		echo "Compressing JPGs with custom quality: $jpglossy"
	fi;
	
	rm ~tmp4gee982j3goij0j5409jh53-3g353.jpg 2> /dev/null; find . \( -iname '*.jpg' -o -iname '*.jpeg' \) -exec bash -c 'mozjpeg -report -quality "'"$jpglossy"'" "$1" > ~tmp4gee982j3goij0j5409jh53-3g353.jpg; mv ~tmp4gee982j3goij0j5409jh53-3g353.jpg "$1"' sh {} \;
	
}

function pngif () {
	local lossy=$1;
	local colors=$2;
	local delay=$3;
	local loopcount=$4;
	local scale=$5;
	img_extension="png";
	imgsToGifs $lossy $colors $delay $loopcount $scale;
}

function jpgif () {
	local lossy=$1;
	local colors=$2;
	local delay=$3;
	local loopcount=$4;
	local scale=$5;
	img_extension="jpg";
	imgsToGifs $lossy $colors $delay $loopcount $scale;
}

function imgsToGifs () {

	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Incorrect directory. Make sure you've specified the right one";
			return 0;
	fi;

	if [[ -z $(find . -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png") ]]
	then
		echo "There's no images."
		return 0;
	fi;

	lossy=20;
	colors=256;
	delay=300;
	loopcount=0;
	scale="0.5";

	echo -e "\n\nUsage example:\n\n'pngif 45 128 200 3 1' means convert/compress gif by using \n--lossy to 45 (20 by default) \n--colors to 128 (256 by default) \n--delay 200/100sec (3sec by default) \n--loopcount 0 (forever) \n--set scale factor (0.5 by default)\n";

	if [[ "$1" > 0 ]];
	then
		lossy=$1;
	fi;

	if [[ "$2" > 1 ]];
	then
		colors=$2;
	fi;

	if [[ "$3" > 0 ]];
	then
		delay=$3;
	fi;

	if [[ ! -z "$4" ]]
	then
		loopcount=$4;
	fi;

	if [[ ! -z "$5" ]] 
	then
		scale=$5;
	fi;

	echo -e "\n\t--info--\n\tLOSSY:  $lossy\n\tCOLORS: $colors\n\tDELAY:  ${delay}/100 sec \n\tLOOP: $loopcount \n\tSCALE:  $scale\n"
		
	active_dir=$PWD;
	for subdir in */; do cd "$subdir"; convert -delay "${delay}" -loop 0 "*.$img_extension" ~tmpgif.gif; gifsicle ~tmpgif.gif --scale "$scale" --colors "$colors" --lossy="$lossy" --loopcount=$loopcount > "${subdir::-1}.gif"; rm ~tmpgif.gif; mv "${subdir::-1}.gif" "$active_dir/${subdir::-1}.gif"; cd "$active_dir"; done;

}

#aliases_end#



function folder_gen () {
	local new_dir_name;
	for f in *.*; do new_dir_name=$(echo $f | sed 's/^[^_]*_//' | sed 's/_.*//g'); mkdir $new_dir_name; done;
}








function cdw () {
	cd "$(wslpath -u $1)";
}

 

function winstart () {

	local active_dir=$PWD;

	local filetype=$1;
	local depth=$2;
	local program=$3;

	if [ -z $1 ]
	then
		echo -e "Nothing to open! \nUsage example: 'winstart [filename] [find_maxdepth] [program]' \nExample: winstart \"*.gif\" 2 firefox (It means open all found GIFs by 'find' command with -maxdepth equal 2 via Firefox)"
		return 0
	fi;

	if [ -z $2 ]
	then
		depth=1;
	fi;

	if [ -z $3 ] 
	then
		find . -maxdepth "$depth" -iname "$filetype" -exec bash -c 'cmd.exe /C "$(wslpath -w "$1")";' sh {} \;
	else
		find . -maxdepth "$depth" -iname "$filetype" -exec bash -c 'cmd.exe /C start '$program' "$(wslpath -w "$1")";' sh {} \;
	fi;

}

function clearexif () {

	if [ -z $1 ] 
	then
		echo "No arguments. use 'clearexif all' to wipe all exif data found in current directory, or 'clearexif pathtoimage/image.jpg to remove exif data for specific file";
		return 0;
	else 
		exiftool -all= $1 -overwrite_original;
		echo -e "\nEXIF DATA HAS BEEN REMOVED, RESULT:\n";
		exiftool --verbose $1;
	fi;
}











# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# TO DO: UNSET THE OTHERS TOO
unset color_prompt force_color_prompt 

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



#VcXsrv
export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
