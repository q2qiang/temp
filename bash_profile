# java path
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
export CATALINA_BASE=/Users/hzq/server/apache-tomcat-7.0.78
export CATALINA_HOME=/Users/hzq/server/apache-tomcat-7.0.78
export PATH=$PATH:$JAVA_HOME:$CATALINA_HOME:$CATALINA_BASE

# android path
export ANDROID_HOME=/Users/hzq/Library/Android/sdk
export PATH=/usr/local/bin:$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$JAVA_HOME/bin
export PATH=$PATH:/Users/hzq/Library/Android/sdk/build-tools/26.0.1
# package path  
export PATH=$PATH:/opt/pkg_uninstaller
# gradle path 
GRADLE_HOME=/Applications/Android\ Studio.app/Contents/gradle/gradle-4.1;
export GRADLE_HOME
export PATH=$PATH:$GRADLE_HOME/bin

# alias command
alias grep='grep --color=always'
alias inspector1='inspector -u Y15QKCPG252SY'
alias of='open -a Finder ./'
alias nox='adb connect 127.0.0.1:62001'
alias mu='adb connect 127.0.0.1:5555'
alias aa='if [ $TERM != "screen-256color"  ] && [  $TERM != "screen"  ]; then;tmux attach || tmux new; exit;fi'
alias mkcscopefile='find . -name "*.go" -print >> cscope.files'
alias mktag='ctags -R;cscope -bR'
alias rm='trash'

# xcrun command
alias cap='xcrun simctl io booted screenshot'
alias mov='xcrun simctl io booted recordVideo'

# gamestart
alias game='/Users/hzq/games/yasuhatimac/Contents/MacOS/yasuhatimac'

# alias DNS command dnsmasq
alias dnsflush='sudo killall -HUP mDNSResponder'
alias dnsstop='sudo launchctl stop homebrew.mxcl.dnsmasq'
alias dnsstart='sudo launchctl start homebrew.mxcl.dnsmasq'

#Python virtualenv config
alias mkvir2='mkvirtualenv'
alias mkvir3='mkvirtualenv --python=/usr/local/bin/python3'
#export PIP_REQUIRE_VIRTUALENV=true
export WORKON_HOME=$HOME/.virtualenvs
export PYTHON_HOME=/usr/local/Cellar/python3/3.6.1
export PATH=$PYTHON_HOME/bin:$PATH
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/Cellar/python3/3.6.1/
source /usr/local/bin/virtualenvwrapper.sh

#GO config
export GOROOT=/usr/local/Cellar/go/1.10.2/libexec
# export PATH=/usr/local/go/bin:$PATH
export GOPATH=/Users/hzq/go/xunlei:/Users/hzq/go/mypro
export GOBIN=$GOROOT/bin
export PATH=$PATH:$GOBIN

#ADB shell
export PATH=${PATH}:/Users/hzq/Library/Android/sdk/platform-tools
export PATH=${PATH}:/Users/hzq/Library/Android/sdk/tools

#maven config
# export MAVEN_HOME=/Users/hzq/server/apache-maven-3.5.0
# export PATH=$PATH:$MAVEN_HOME/bin

#ruby path
RUBY_HOME=/user/local/Cellar/ruby
export PATH=$PATH:$RUBY_HOME/bin	

#lua path
LUA_HOME=/usr/local/Cellar/lua
export PATH=$PATH:$LUA_HOME/bin

# TESSDATA_PREFIX
TESSDATA_PREFIX=/usr/local/Cellar/tesseract/3.05.01

export CSCOPE_DB=$HOME/GoProjects/src/cscope.out
