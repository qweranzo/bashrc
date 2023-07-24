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
# all tools: ffmpeg, exiftool, ssh, nmap, gifsicle, mozjpeg, pngquant, svgo, npm, git, node, 



user_wsl='roman';
user_lin="$(whoami)";
user_mac="$(whoami)";

alias vscode="/mnt/c/Users/$user_wsl/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"
alias desktop="cd /mnt/c/Users/$user_wsl/Desktop"
alias downloads="cd /mnt/c/Users/$user_wsl/Downloads"
alias aerender="/mnt/c/Program\ Files/Adobe/Adobe\ After\ Effects\ 2020/Support\ Files/aerender.exe"
alias ffcountframes="ffprobe -v error -select_streams v:0 -show_entries stream=nb_frames -of default=nokey=1:noprint_wrappers=1"
alias ffcountframesmkv="ffprobe -v error -count_frames -select_streams v:0 -show_entries stream=nb_read_frames -of default=nokey=1:noprint_wrappers=1"
alias editbrc="nano ~/.profile"




check () {
	echo 'ITS OOOOOOOOOOOOOKKKK!!!!!!!!!!!!';
}

check2 () {
	echo 'this is check 2 functtion';
}


# alias install_necessary_packages_mac="brew update;
# brew install \
# zip \
# unzip \
# imagemagick \
# pngquant \
# gifsicle \
# mozjpeg \
# libpng \
# npm;
# npm install -g svgo;"



# TO DO: set file size limit for: jpgmin pngmin pngif jpgif !!!!!!!!!!
# TO DO: --optimize -O2 Also uses transparency! 
# TO DO: folder_gen. move images to created folders ???





# ------------------------------------ IMAGE TOOLS START ------------------------------------ #


# --- INFO --- #

# Команда для установки необходимых интрументов - install_necessary_packages

# Проверить версии программ - check_img_tools
# у меня это следующие версии:
# JPG:    mozjpeg version 4.1.2 (build 20221122)
# PNG:    2.12.2 (July 2019)
# SVG:    3.0.2
# GIF:    LCDF Gifsicle 1.92 (Не ранее 1.92 ОБЯЗАТЕЛЬНО!!)
# ImageMagick:	6.9.11-60


# --- IMAGE COMPRESS --- #

# pngmin
# Что делает: сжимает и перезаписывает ВСЕ найденные в текущей директории png
# Как пользоваться: pngmin [quality] - опционально, по-умолчанию 100. 
# Пример: pngmin 
# Пример 2: pngmin 60

# jpgmin
# Что делает: сжимает и перезаписывает ВСЕ найденные в текущей директории jpg
# Как пользоваться: jpgmin [quality] - опционально, по-умолчанию 75.
# Пример: jpgmin
# Пример 2: jpgmin 55

# svgmin
# Что делает: сжимает без потерь и перезаписывает ВСЕ найденные в текущей директории svg
# Как пользоваться: svgmin (без параметров/аргументов)
# Пример: svgmin



# --- IMAGE TO GIF --- #

# jpgif
# Что делает: 
	# в текущей директории ищет папки с jpg-секвенциями
	# склеивает их в gif в алфавитном порядке
	# сжимает gif и уменьшает разрешение в два раза (по умолчанию скейл 0.5, но его можно менять)
	# переименовывает гифы по имени папок (в которых находятся картинки из которых делаем гиф) 
	# вытаскивает эти гифы в родительский каталог (где сами папки лежат)
# Как пользоваться: jpgif [lossy] [colors] [delay] [loop] [scale] - все параметры опционально, 
	# по-умолчанию: 
		# lossy=20 (в отличие от jpgmin и pngmin, чем выше значение, тем сильнее компрессия, т.е. ниже качество)
		# colors=256 (Максимально возможное значение)
		# delay=300 (Задержка/длительность кадра в формате сотых долей секунды - 300/100 секунд = 3 секунды)
		# loop=0 (Количество повторов, 0 - бесконечно)
		# scale=0.5 (Масштаб)
# Пример: jpgif
# Пример 2: jpgif 74 
# Пример 3: jpgif 82 152 100 4 1 - склеить в гифы с компрессией 82, оставить 152 цвета, 1 секунда на кадр, с 4-мя повтороами, масштаб - 1

# pngif
# Что делает: (аналогично jpgif, только для png)


# --- ZIP --- #

# unzipall
# Что делает: распаковывает все найденные в текущей директории zip архивы
# Как пользоваться: unzipall (без параметров/аргументов)
# Пример: unzipall

# zipall 
# Что делает: пакует все найденные папки в текущей директории в zip архивы
# Как пользоваться: zipall ['r'] - параметр 'r' значит - паковать рекурсивно все файлы во всех дочерних директориях
# Пример: zipall
# Пример: zipall r


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


alias check_img_tools='

printf "%s\n"; 
printf "%s\t" "JPG:"; 
mozjpeg -version;

printf "%s\t" "PNG:"; 
pngquant --version; 

printf "%s\t" "SVG:"; 
svgo -version; 

printf "%s\t" "GIF:"; 
gifsicle --version; 

printf "%s\n"; 
printf "%s\t" "ImageMagick:"; 
convert -version; 

printf "%s\n"';


unzipall () {
	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Wrong directory. No access to HOME or ROOT dir";
			return 0;
	fi;
	for f in *.zip; do unzip "$f" -d "${f:0:-4}"; done; 
}

zipall () {
	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Wrong directory. No access to HOME or ROOT dir";
			return 0;
	fi;

	local recursive='';

	if [[ ! -z "$1" ]]
		then 
			if [[ "$1" == "r" ]]
			then
				recursive="-r";
			else 
				echo "Unknow arg \"$1\"";
				return 0;
			fi;
	fi;

	

	parentdirname=$PWD; 
	for dirname in */; do dirname=${dirname%*/}; cd "$parentdirname/$dirname"; zip $recursive "$dirname.zip" ./*; mv "$dirname.zip" "$parentdirname/"; done; cd "$parentdirname";
};


# Extract one of the RGBA channels, draw extracted channel on the new jpg image
extractchannel () {

	local channel=$1;

	if [[ $channel == "alpha" ]]
	then
		find . -type f -iname '*.*' ! -iname '*~ch~*.*' -exec bash -c 'convert $1 -alpha extract ${1:0:-4}~ch~ALPHA.jpg' 'sh' {} \;

	elif [[ $channel == "red" ]]
	then
		find . -type f -iname '*.*' ! -iname '*~ch~*.*' -exec bash -c 'convert $1 -channel R -separate ${1:0:-4}~ch~RED.jpg' 'sh' {} \;

	elif [[ $channel == "green" ]]
	then
		find . -type f -iname '*.*' ! -iname '*~ch~*.*' -exec bash -c 'convert $1 -channel G -separate ${1:0:-4}~ch~GREEN.jpg' 'sh' {} \;

	elif [[ $channel == "blue" ]]
	then
		find . -type f -iname '*.*' ! -iname '*~ch~*.*' -exec bash -c 'convert $1 -channel B -separate ${1:0:-4}~ch~BLUE.jpg' 'sh' {} \;

	else 
		echo "channel "$channel" not found. available channels: red, green, blue, alpha";

	fi;

	echo "channel: $channel";
	
}


svgmin () {
	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Wrong directory. No access to HOME or ROOT dir";
			return 0;
	fi;

	if [[ -z $(find . -iname '*.svg') ]]
	then
		echo "There's no SVGs."
		return 0;
	fi;

	find . -iname '*.svg' -exec svgo {} \;
}

pngmin () {

	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Wrong directory. No access to HOME or ROOT dir";
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

jpegtojpg () {
	find . -iname '*.jpeg' -exec bash -c 'origname=$1; mv "$origname" "${origname:0:-4}jpg"' sh {} \;
}

jpgmin () {
	
	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Wrong directory. No access to HOME or ROOT dir";
			return 0;
	fi;

	if [[ -z $(find . \( -iname '*.jpg' -o -iname '*.jpeg' \)) ]]
	then
		echo "There's no JPGs."
		return 0;
	fi;

	# rename .jpeg to .jpg
	jpegtojpg;

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

pngif () {
	local lossy=$1;
	local colors=$2;
	local delay=$3;
	local loopcount=$4;
	local scale=$5;
	img_extension="png";
	imgsToGifs $lossy $colors $delay $loopcount $scale;
}

jpgif () {
	local lossy=$1;
	local colors=$2;
	local delay=$3;
	local loopcount=$4;
	local scale=$5;
	img_extension="jpg";
	imgsToGifs $lossy $colors $delay $loopcount $scale;
}

imgsToGifs () {

	if [[ $PWD == ~ ]] || [[ $PWD == "/" ]]
		then 
			echo "Wrong directory. No access to HOME or ROOT dir";
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
	for subdir in */; do cd "$subdir"; convert -delay "${delay}" -loop 0 "*.$img_extension" ~tmpgif.gif; gifsicle ~tmpgif.gif --scale "$scale" --colors "$colors" --lossy="$lossy" --loopcount=$loopcount > "${subdir::-1}.gif"; rm ~tmpgif.gif; mv "${subdir::-1}.gif" "$active_dir/${subdir:0:-1}.gif"; cd "$active_dir"; done;

}

# ------------------------------------ IMAGE TOOLS END ------------------------------------ #

# swap string in docs found by 'find' tool using 'sed'
string-swap () {
	local doc_name="$1";
	local str_from="$2";
	local str_to="$3";
	find . -iname $doc_name -exec sed -i 's/'''$str_from'''/'''$str_to'''/g' {} \;
}

# delete EXIF data using 'exiftool'
clearexif () {

	if [ -z $1 ] 
	then
		echo "No args. Usage: \"clearexif filename\" or \"clearexif allfiles\" ";
		return 0;

	elif [ $1 == "allfiles" ]
	then
		find . -iname '*.*' -exec bash -c 'exiftool -all= $1 -overwrite_original; exiftool --verbose $1; printf "%s\n\n\n\n\n"' sh {} \;

	else 
		exiftool -all= $1 -overwrite_original;
		echo -e "\nEXIF DATA HAS BEEN REMOVED, RESULT:\n";
		exiftool --verbose $1;
	fi;
}

disk () {
	cd /mnt/$1;
}

# extract size () - "NxN" from file name and create folder named NxN  
folder_gen () {
	local new_dir_name;
	for f in *.*; do new_dir_name=$(echo $f | sed 's/^[^_]*_//' | sed 's/_.*//g'); mkdir $new_dir_name; done;
}

to_getintent () {
	find . -type f -iname *.html -exec sed -i 's/<div id="bs"><\/div>/\n\t<div id="Stage">\n\t\t<div id="bs"><\/div>\n\t<\/div>\n\t/g' {} \;
}

# WSL only; Find files using Linux bash 'find' and open by windows CMD 'start' 
winstart () {

	local active_dir=$PWD;

	local filetype=$1;
	local depth=$2;
	local program=$3;

	if [ -z $1 ]
	then
		echo -e "Nothing to open! \nUsage 'winstart [filename] [find_maxdepth] [program](optional, skip if default app is needed)' \nExample: winstart \"*.gif\" 2 firefox"
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
export DISPLAY=:0.0
export LIBGL_ALWAYS_INDIRECT=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# image tools 
export -f jpgif pngif imgsToGifs clearexif jpgmin pngmin svgmin;

# test
export -f check2;
