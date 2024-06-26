#!/usr/bin/env bash

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;36m"
NORMAL="\033[0m"

# nvim
NVIM_MESSAGE_BREW="Please install Homebrew or use antibody bundle luismayta/zsh-brew"
NVIM_MESSAGE_DONE="Keep calm and use nvim"
NVIM_REPO_HTTPS="https://github.com/luismayta/nvimrc.git"

# home
HOME_CONFIG_PATH="${HOME}/.config"

# nvim
NVIM_CONFIG_PATH="${HOME_CONFIG_PATH}/nvim"
NVIM_PACKAGE_NAME="nvim"

PYTHON_PACKAGES_NVIM=(
  msgpack
  pynvim
  jedi
)

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
  printf "${GREEN}%s${NORMAL}\n" "🧉 [SUCCESS]: ${1}"
}

nvim::install::dependences() {
  message_info "Installing dependencies for ${NVIM_PACKAGE_NAME}"

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
  message_success "Installed dependencies for ${NVIM_PACKAGE_NAME}"
}

# nvim::backup::config - backup configuration NVIM app
nvim::backup::config() {
  message_info "You will see your old ${NVIM_CONFIG_PATH} as ${HOME_CONFIG_PATH}/NVIM.bak"
  mv "${NVIM_CONFIG_PATH}" "${HOME_CONFIG_PATH}/NVIM.bak"
  message_success "Backup config for ${NVIM_PACKAGE_NAME}"
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

nvim::clean() {
  message_info "Start cleaning configurations for ${NVIM_PACKAGE_NAME}"
  rm -rf "${NVIM_CONFIG_PATH}"
  rm -rf ~/.local/share/nvim
  rm -rf ~/.cache/nvim
  message_success "Finished cleaning configurations for ${NVIM_PACKAGE_NAME}"
}

nvim::post_install() {
  message_info "Post Install for ${NVIM_PACKAGE_NAME}"

  message_info "Looking for an existing NVIM config..."
  if [ -d "${NVIM_CONFIG_PATH}" ]; then
      message_warning "Found existing ${NVIM_CONFIG_PATH}"
      nvim::backup::config
  fi

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  message_info "Cloning NVIM from ${NVIM_REPO_HTTPS}"

  env git clone --depth=1 "${NVIM_REPO_HTTPS}" --branch main "${NVIM_CONFIG_PATH}" || {
      message_warning "git clone of NVIM repo failed."
      return
  }

  message_success "${NVIM_MESSAGE_DONE}"
  message_success "Post Installed ${NVIM_PACKAGE_NAME}"
}

nvim::install
nvim::post_install