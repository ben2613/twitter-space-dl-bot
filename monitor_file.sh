#!/bin/sh
inotifywait -m /gdrive -e create -e moved_to |
  while read directory action file; do
    if [[ $(expr match "$file" '.*m4a$') != 0 ]]; then # Does the file end with .m4a?
      gdrive --service-account gdrive_cred.json upload -p "$GDRIVE_UPLOAD_DEST_ID" "$file" && rm "$file"
    fi
  done
