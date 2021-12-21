- Go https://console.cloud.google.com/iam-admin/serviceaccounts/ to create your project and service account
- Make sure you activated **Drive API**
- Create and download the key json of the project and rename it as gdrive_cred.json
- Create a folder for uploading at your drive
- Share the folder with edit right to your service account it should look like `bot@mytwitterproject.iam.gserviceaccount.com`
- copy the folder ID to env `GDRIVE_UPLOAD_DEST_ID`
- Copy the twitter user ids to env USER_LIST as comma-separated list with no space
- e.g. `USER_LIST=user1,user2,user3`
- Run `docker run -it --rm -e 'GDRIVE_UPLOAD_DEST_ID=<folder id>' -e 'USER_LIST=<comma separated user_id list>' -v <path_to_gdrive_cred.json>:/gdrive/gdrive_cred.json twitterspacedlbot`
- Done!
