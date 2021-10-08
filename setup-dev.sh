#!/bin/bash
BOLD='\e[1m'
LIGHT_BLUE='\033[1;34m'
LIGHT_GREEN='\e[92m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

NODE_ICON="${LIGHT_GREEN}⬢${LIGHT_BLUE}"

PREREQUISITES="git curl"

function println { printf "${BOLD}${LIGHT_BLUE}$*${NO_COLOR}\n"; }
function println_red { printf "${BOLD}${RED}$*${NO_COLOR}\n"; }
function error_if_failed {
	if [ $1 -ne 0 ]; then
		println "${RED}$2"
		exit $3
	fi
}


println_red 
println_red 
println_red ' /▀▀▀▀▀▀▀▀ /▀▀   /▀▀ /▀▀▀▀▀▀▀▀  /▀▀▀▀▀▀   /▀▀▀▀▀▀   /▀▀▀▀▀▀ '
println_red '| ▀▀_____/| ▀▀▀ | ▀▀|__  ▀▀__/ /▀▀__  ▀▀ /▀▀__  ▀▀ /▀▀__  ▀▀'
println_red '| ▀▀      | ▀▀▀▀| ▀▀   | ▀▀   | ▀▀  \__/| ▀▀  \ ▀▀| ▀▀  \__/'
println_red '| ▀▀▀▀▀   | ▀▀ ▀▀ ▀▀   | ▀▀   |  ▀▀▀▀▀▀ | ▀▀  | ▀▀| ▀▀      '
println_red '| ▀▀__/   | ▀▀  ▀▀▀▀   | ▀▀    \____  ▀▀| ▀▀  | ▀▀| ▀▀      '
println_red '| ▀▀      | ▀▀\  ▀▀▀   | ▀▀    /▀▀  \ ▀▀| ▀▀  | ▀▀| ▀▀    ▀▀'
println_red '| ▀▀▀▀▀▀▀▀| ▀▀ \  ▀▀   | ▀▀   |  ▀▀▀▀▀▀/|  ▀▀▀▀▀▀/|  ▀▀▀▀▀▀/'
println_red '|________/|__/  \__/   |__/    \______/  \______/  \______/ '
println_red
println_red


println "Installing prerequisites - ${PREREQUISITES}"
sudo apt install ${PREREQUISITES}

error_if_failed $? "${RED}An error occurred installing prerequisites ☹️" 1

println "Installing nvm ${NODE_ICON}"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm --version &> /dev/null
error_if_failed $? "${RED}An error occurred installing nvm ☹️" 2

println "Installing NodeJS v12.16.3 ${NODE_ICON}"
nvm install 12.16.3
error_if_failed $? "${RED}An error occurred installing NodeJS ☹️" 3

println "Switching to NodeJS v12.16.3 ${NODE_ICON}"
nvm use 12.16.3

println "Installing Yarn 🧶"
npm i -g yarn

yarn --version &> /dev/null
error_if_failed $? "${RED}An error occurred installing yarn ☹️" 4

println "🚀 Your development environment has been setup! Happy Hacking! 🚀"
