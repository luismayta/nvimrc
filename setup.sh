#!/usr/bin/env bash

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;36m"
NORMAL="\033[0m"

# nvchad
NVCHAD_REPOSITORY_URL="https://github.com/NvChad/NvChad"


# nvim
NVIM_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
NVIM_MESSAGE_DONE="Keep calm and use nvim"
NVIM_REPO_HTTPS="https://github.com/luismayta/nvimrc.git"

# home
HOME_CONFIG_PATH="${HOME}/.config"

# nvimrc
NVIMRC_PATH="${HOME}/.nvimrc"
NVIMRC_LUA_PATH="${NVIMRC_PATH}/nvim/lua"
NVIMRC_CUSTOM_PATH="${NVIMRC_LUA_PATH}/custom"

# nvim
NVIM_CONFIG_PATH="${HOME_CONFIG_PATH}/nvim"
NVIM_PACKAGE_NAME="nvim"
NVIM_ROOT_PATH="${HOME}/.nvim"

PYTHON_PACKAGES_NVIM=(
  msgpack
  pynvim
  jedi
)

NVIM_LUA_PATH="${NVIM_CONFIG_PATH}/lua"
NVIM_CUSTOM_PATH="${NVIM_LUA_PATH}/custom"

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
  message_info "Installing dependences ${NVIM_PACKAGE_NAME}"
  mkdir -p "${NVIM_CONFIG_PATH}"

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

# nvim::backup::config - backup configuration NVIM app
nvim::backup::config() {
  message_info "You will see your old ${NVIM_CONFIG_PATH} as ${NVIM_CONFIG_PATH}/NVIM.bak"
  mv "${NVIM_CONFIG_PATH}" "${NVIM_CONFIG_PATH}/NVIM.bak"
  message_success "backup config ${NVIM_PACKAGE_NAME}"
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
  message_info "start clean configurations ${NVIM_PACKAGE_NAME}"
  rm -rf "${HOME_CONFIG_PATH}"/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.cache/nvim
  message_success "finish clean configurations ${NVIM_PACKAGE_NAME}"
}

nvchad::install() {
  message_info "Install nvchad"
  git clone "${NVCHAD_REPOSITORY_URL}" "${NVIM_CONFIG_PATH}" --depth 1 && nvim
  message_success "Installed nvchad"
}

nvim::post_install() {
  message_info "Post Install ${NVIM_PACKAGE_NAME}"

  message_info "Looking for an existing NVIM config..."
  if [ -d "${NVIM_CONFIG_PATH}" ]; then
      message_warning "Found ${NVIM_CONFIG_PATH}"
      nvim::backup::config
  fi

  nvchad::install

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  message_info "Cloning NVIM from ${NVIM_REPO_HTTPS}"

  env git clone --depth=1 "${NVIM_REPO_HTTPS}" --branch main "${NVIM_ROOT_PATH}" || {
      message_warning "git clone of NVIM repo failed."
      return
  }

  ln -fs "${NVIMRC_CUSTOM_PATH}" "${NVIM_CUSTOM_PATH}"

  message_success "${NVIM_MESSAGE_DONE}"

  nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
  message_success "Post Installed ${NVIM_PACKAGE_NAME}"
}

nvim::install
nvim::post_install
