#!/bin/sh

# check all files are valid
if [ ! -f /gdrive/gdrive_cred.json ]; then
  echo "gdrive_cred.json is not valid" 1>&2
  exit
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
  done
  sleep 15
done
