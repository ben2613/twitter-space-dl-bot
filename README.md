# Deprecated
In order to get more functionality I want I am rewriting this in ...maybe node? 

This is just a script containing [Ryu1845/twspace-dl](https://github.com/Ryu1845/twspace-dl) and [prasmussen/gdrive](https://github.com/prasmussen/gdrive) to let me check downloaded space files on my phone.

## Preparation

- Go https://console.cloud.google.com/iam-admin/serviceaccounts/ to create your project and service account
- Make sure you activated **Drive API**
- Create and download the key json of the project
- Create a folder for uploading at your Google Drive
- Share the folder with edit right to your service account, it should look like `bot@mytwitterproject.iam.gserviceaccount.com`

Required Environment Variable
- `GDRIVE_UPLOAD_DEST_ID`: Google Drive Folder ID
- `USER_LIST`: comma-separated list without space of twitter user ids to monitor
- e.g. `USER_LIST=user1,user2,user3`

Run `docker run -it --rm -e 'GDRIVE_UPLOAD_DEST_ID=<<folder id>>' -e 'USER_LIST=<<user_ids>>' -v <<path_to_gdrive_cred.json>>:/gdrive/gdrive_cred.json twitter-space-dl-bot`
or if volume is not avaiable
`CERT=$(cat <<path_to_gdrive_cred>>) && docker run -it --rm -e "CERT=$CERT" -e 'GDRIVE_UPLOAD_DEST_ID=<<folder id>>' -e 'USER_LIST=<<user_ids>>' twitter-space-dl-bot`
