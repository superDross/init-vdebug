set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

DIR="${HOME}/.vim/debuggers"

download_debuggers() {
  local unameOut="$(uname -s)"
  case "${unameOut}" in
      Linux*)     machine='linux-x86_64';;
      Darwin*)    machine='macosx';;
      *)          machine="UNKNOWN:${unameOut}"
  esac

  local link="http://downloads.activestate.com/Komodo/releases/11.1.0/remotedebugging/Komodo-PythonRemoteDebugging-11.1.0-91033-${machine}.tar.gz"
  wget -P $DIR $link
}

setup_debuggers() {
  tar -xzf ${DIR}/*tar.gz -C $DIR
  mv ${DIR}/Komodo*/* ${DIR}/python2/
  cp -r ${DIR}/python2/* ${DIR}/python3/
  cp -r ${DIR}/python2/pythonlib/dbgp ${DIR}/python2/
  cp -r ${DIR}/python3/python3lib/dbgp ${DIR}/python3/
  rm -r ${DIR}/Komodo*
}

main() {
  if [ ! -d "${DIR}/python3/dbgp/" ]; then
    mkdir -p ${DIR}/python2 ${DIR}/python3
    download_debuggers
    setup_debuggers
  fi
}

main
