main() {

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  printf "Cloning Solarized mc skin\n"
  hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
  }

  IDIR=~/mc-solarized-skin

  env git clone https://github.com/csepi83/mc-skin $IDIR || {
    printf "Error: git clone of mc-skin repo failed\n"
    exit 1
  }

  SKIN="solarized"
  DIR=~/.config/mc
  SDIR="~/.config/mc"

  printf "Copying skin\n"
  cp $IDIR/$SKIN.ini $DIR/
  
  printf "echo profile\n"
  echo "export MC_SKIN=$SDIR/$SKIN.ini" >> ~/.profile

  printf "done"
}

main
