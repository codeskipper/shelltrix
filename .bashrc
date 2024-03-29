## Some aliases -tested with bash on macOS-
# import using source ~/.bashrc

# provide timestamps in ISO 8601 notation -I for Zulu time, -i for local
date() {
  if [ "$1" = "-i" ]; then
    command date "+%Y-%m-%dT%H:%M:%S%z"
  else
      if [ "$1" = "-I" ]; then
         command date  -u "+%Y-%m-%dT%H:%M:%SZ"
      else
        command date "$@"
      fi
  fi
}

# provide timestamps in ISO 8601 notation using custom alias for date defined above
ping() {
  if [[ "$1" == "--datamind-time" ]]; then
    shift
    command ping "$@"  2>&1 | while read pong; do echo "$(date -I): $pong"; done
  else
    command ping "$@"
  fi
}


## Download a named file using curl, ISO 8601 timestamp before and after
durl() {
  if [[ "$1" == "-I" ]]; then
    date -I
    shift
    command curl --remote-name "$@"
    date -I
  elif [[ "$1" == "-i" ]]; then
    date -i
    shift
    command curl --remote-name "$@"
    date -i
  else
    date -i
    command curl --remote-name "$@"
    date -i
  fi
}


# unzip a named archive with malware samples from https://objective-see.com/malware.html with 
# standard password into current directory and provide timestamp using custom date() function
malunzip() {
  unzip -P infect3d "$1"
  date -i
}


#alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
