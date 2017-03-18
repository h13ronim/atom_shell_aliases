# source: https://github.com/atom/atom.io/issues/9#issuecomment-229373728
apms() {
  local PARAM=$1
  local NAME=$2

  case $PARAM in
    "-s" )
      apm search $NAME | sed "s#(#( #g" | grep \) | awk '{print $(NF-1),$0}' | sort -n -r
      ;;
    "-d" )
      apm search $NAME | sed "s#(#( #g" | grep \) | awk '{print $(NF-3),$0}' | sort -n -r
      ;;
    *)
      echo "Usage: apms -s|-d package"
  esac
}
