#!/usr/bin/env bash

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;36m"
NORMAL="\033[0m"

VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
NVIM_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
NVIM_MESSAGE_DONE="Keep calm and use nvim"
NVIM_REPO_HTTPS="https://github.com/luismayta/nvimrc.git"
NVIMRC_NAME="init.nvim"
NVIM_CONFIG_DIR="${HOME}/.config"
NVIM_PACKAGE_NAME="nvim"
PYTHON_PACKAGES_NVIM=(
    pynvim
    jedi
)
SRC_NVIM_DIR="$(pwd)/$(dirname "${0}")/nvim"
NVIM_SRC_NVIMRC="${SRC_NVIM_DIR}/${NVIMRC_NAME}"
NVIM_DST_NVIM_DIR="${NVIM_CONFIG_DIR}/nvim"
NVIM_DST_NVIMRC="${NVIM_DST_NVIM_DIR}/${NVIMRC_NAME}"

message_error() {
    printf "${RED}%s${NORMAL}\n" "[ERROR]: ${1}"
    return 0
}

message_info() {
    printf "${BLUE}%s${NORMAL}\n" "[INFO]: ${1}"
}

message_warning() {
    printf "${YELLOW}%s${NORMAL}\n" "[WARNING]: ${1}"
}

message_success() {
    printf "${GREEN}%s${NORMAL}\n" "🍺️ [SUCCESS]: ${1}"
}

nvim::install::vimplug() {
    if ! type -p curl > /dev/null; then
        message_warning "Please Install curl"
        return
    fi
    message_info "Installing vim plug for ${NVIM_PACKAGE_NAME}"
    # Install vim-plug
    mkdir -p nvim/autoload
    curl -Lo nvim/autoload/plug.vim "${VIM_PLUG_URL}"
    message_success "Installed vim plug for ${NVIM_PACKAGE_NAME}"
}

nvim::install::dependences() {
    message_info "Installing dependences ${NVIM_PACKAGE_NAME}"

    # Install neovim-python; vim-plug requires neovim-python
    if type -p pip > /dev/null; then
        pip install --upgrade pip
        for module in "${PYTHON_PACKAGES_NVIM[@]}"; do
            pip install --user "${module}"
        done
    fi

    if type -p pip3 > /dev/null; then
        for module in "${PYTHON_PACKAGES_NVIM[@]}"; do
            pip3 install --user "${module}"
        done
    fi

    if ! type -p brew > /dev/null; then
        message_warning "${NVIM_MESSAGE_BREW}"
        return 0
    fi

    hash git >/dev/null 2>&1 || {
        brew install git
    }

    hash curl >/dev/null 2>&1 || {
        brew install curl
    }

    hash wget >/dev/null 2>&1 || {
        brew install wget
    }
    message_success "Installed dependences ${NVIM_PACKAGE_NAME}"
}

# nvim::install - install NVIM app
nvim::install() {
    nvim::install::dependences
    if ! type -p brew > /dev/null; then
        message_warning "${NVIM_MESSAGE_BREW}"
        return
    fi
    if ! type -p nvim > /dev/null; then
        message_info "Install ${NVIM_PACKAGE_NAME}"
        brew install nvim
        message_success "Installed ${NVIM_PACKAGE_NAME}"
    fi
}

nvim::post_install() {
    message_info "Post Install ${NVIM_PACKAGE_NAME}"

    mkdir -p "${NVIM_CONFIG_DIR}"

    message_info "Looking for an existing NVIM config..."
    if [ -d "${NVIM_DST_NVIM_DIR}" ]; then
        message_warning "Found ${NVIM_DST_NVIM_DIR}"
        message_info "You will see your old ${NVIM_DST_NVIM_DIR} as ${NVIM_DST_NVIM_DIR}/NVIM.bak"
        mv "${NVIM_DST_NVIM_DIR}" "${NVIM_DST_NVIM_DIR}/NVIM.bak"
    fi

    # Prevent the cloned repository from having insecure permissions. Failing to do
    # so causes compinit() calls to fail with "command not found: compdef" errors
    # for users with insecure umasks (e.g., "002", allowing group writability). Note
    # that this will be ignored under Cygwin by default, as Windows ACLs take
    # precedence over umasks except for filesystems mounted with option "noacl".
    umask g-w,o-w

    message_info "Cloning NVIM from ${NVIM_REPO_HTTPS}"

    env git clone --depth=1 "${NVIM_REPO_HTTPS}" --branch develop "${NVIM_DST_NVIM_DIR}" || {
        message_warning "git clone of NVIM repo failed."
    }

    message_success "${NVIM_MESSAGE_DONE}"

    # Install plugins using vim-plug
    nvim +PlugInstall +PlugUpdate +PlugClean! +qall
    message_success "Post Installed ${NVIM_PACKAGE_NAME}"
}

nvim::install
nvim::post_install
