#!/bin/sh

# check all files are valid
if [ ! -f /gdrive/gdrive_cred.json ]; then
  echo "Warning: gdrive_cred.json is not valid, try parsing it from CERT env" 1>&2
  if test -z "${CERT}" ; then
    echo "Error env CERT is empty" 1>&2
    exit
  elif echo "${CERT}" > /gdrive/gdrive_cred.json ; then
    echo "Successfully parsed gdrive_cred.json from CERT env"
  else
    echo "Error parsing CERT to /gdrive/gdrive_cred.json" 1>&2
    exit
  fi
fi

#check access to your folder
if gdrive --service-account gdrive_cred.json info "$GDRIVE_UPLOAD_DEST_ID" ; then
  echo "seems can access folder"
else
  echo "CANNOT access gdrive folder, please make sure you have share folder to your service account"
  exit
fi

# TODO check your users exist

./monitor_file.sh &
while true
do
  for u in $(echo $USER_LIST | sed "s/,/ /g")
  do
    ./download.sh $u &
    sleep 5
  done
  sleep 60
done
