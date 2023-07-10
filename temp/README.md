# Building and Synchronizing Frontend


To install the `aws_s3_website_sync` gem, run the following command:
```
gem install aws_s3_website_sync
```

To install the `dotenv` gem, run the following command:
```
gem install dotenv
```
- [Setup Different bucket](../journal/week10.md#setting-up-cfn-artifact-bucket)
- [Setup cloudfront distribution](../journal/week7.md#frontend-application-on-cloudfront)

Refine the static frontend content build using the script
```sh
#! /usr/bin/bash

ABS_PATH=$(readlink -f "$0")
FRONTEND_PATH=$(dirname $ABS_PATH)
BIN_PATH=$(dirname $FRONTEND_PATH)
PROJECT_PATH=$(dirname $BIN_PATH)
FRONTEND_REACT_JS_PATH="$PROJECT_PATH/frontend-react-js"

cd $FRONTEND_REACT_JS_PATH

REACT_APP_BACKEND_URL="https://<backend-main-endpoint>" \
REACT_APP_AWS_PROJECT_REGION="$AWS_DEFAULT_REGION" \
REACT_APP_AWS_COGNITO_REGION="$AWS_DEFAULT_REGION" \
REACT_APP_AWS_USER_POOLS_ID="<cognito-user-pool>" \
REACT_APP_CLIENT_ID="<cognito-client-id>" \
npm run build
```






*Generate* the static content and *Synchronize* it using the provided script.

```sh
$ ./bin/frontend/sync 
== configuration
aws_default_region:   ca-central-1
s3_bucket:            yacrud.me
distribution_id:      ERCJBOJCCBILY
build_dir:            /workspace/aws-cloud-project-bootcamp/frontend-react-js/build
output_changset_path: /workspace/aws-cloud-project-bootcamp/tmp
auto_approve:         false
sync ==
I, [2023-07-04T23:12:23.164118 #8951]  INFO -- : Runner.run
I, [2023-07-04T23:12:23.164180 #8951]  INFO -- : List.local
I, [2023-07-04T23:12:23.173776 #8951]  INFO -- : List.remote
I, [2023-07-04T23:12:23.600934 #8951]  INFO -- : Plan.delete
I, [2023-07-04T23:12:23.601001 #8951]  INFO -- : Plan.create_update
---[ Plan ]------------------------------------------------------------
ChangeSet: tmp

WebSync will perform the following operations:

        create android-chrome-512x512.png
        create asset-manifest.json
        create browserconfig.xml
        create index.html
        create mstile-144x144.png
        create mstile-150x150.png
        create mstile-310x150.png
        create mstile-310x310.png
        create mstile-70x70.png
        create static/css/main.61ad3429.css
        create static/css/main.61ad3429.css.map
        create static/js/787.cda612ba.chunk.js
        create static/js/787.cda612ba.chunk.js.map
        create static/js/main.4982a6aa.js
        create static/js/main.4982a6aa.js.LICENSE.txt
        create static/js/main.4982a6aa.js.map
        create static/media/bomb.585e455838778938e175c4311b6a9284.svg
        create static/media/elipses.e1e2c11435294de336f167d28e3387f2.svg
        create static/media/heart.c31d61db7c2d096bd3219a00053eca01.svg
        create static/media/home.4e94b7659059a75c271100122f0b2f23.svg
        create static/media/logo.5753985f6358b14bd71dac0a2953098c.svg
        create static/media/messages.9c2a92621ab30f0780dfbfcc7af26768.svg
        create static/media/more.e13deeada4344cadc8f349f1575607fa.svg
        create static/media/notifications.30f93bb0a78cc8bb07e1a283bb8a3495.svg
        create static/media/profile.a195fff06191f3e91d26f8f44f495b0a.svg
        create static/media/reply.e855b43c7d756ec100f0520b73df4964.svg
        create static/media/repost.3d8455b75243ae9c8440ddecb016ce72.svg
        create static/media/share.858c53d43c95f51422eb938be3942086.svg
--------------------------------------------------------------------
ignore: 8   delete: 0   create: 28   update: 0   no_change: 0

Execute the plan? Type: yes or no
yes
```


**TEMP** output provides status regarding the results of the operation.

| Content Existence      | Change Made         | Action                        |
|------------------------|---------------------|-------------------------------|
| Content exists         | No                  | The synchronization process is ignored as the content already exists. |
| Content does not exist | Yes                 | The synchronization process creates the content as changes have been made. |




```JSON
[
  {
    "path": "android-chrome-192x192.png",
    "md5": "59a9482e575b2b6feeebc4f72af2b428",
    "action": "ignore"
  },
  {
    "path": "android-chrome-512x512.png",
    "md5": "89198de5b64ecbf50a2174e48a4f471d",
    "action": "create"
  },
  {
    "path": "apple-touch-icon.png",
    "md5": "40333f132c8a5b76657d7490bc9915ef",
    "action": "ignore"
  },
  {
    "path": "asset-manifest.json",
    "md5": "7547e9885bb8e37998218d45ce6eb17a",
    "action": "create"
  },
  {
    "path": "browserconfig.xml",
    "md5": "a493ba0aa0b8ec8068d786d7248bb92c",
    "action": "create"
  },
  {
    "path": "favicon-16x16.png",
    "md5": "93534392f993f17bebcbb5ceb9bf6c02",
    "action": "ignore"
  },
  {
    "path": "favicon-32x32.png",
    "md5": "0d2e1debb745019a995135903b7d5d2c",
    "action": "ignore"
  },
  {
    "path": "favicon.ico",
    "md5": "2c62e3258e4e4d044c232ad746d83729",
    "action": "ignore"
  },
  {
    "path": "index.html",
    "md5": "1f02a3e5c1f6c07cd219a91966c45292",
    "action": "create"
  },
  {
    "path": "mstile-144x144.png",
    "md5": "38752cefcf801c965e52d3450e312d0e",
    "action": "create"
  },
  {
    "path": "mstile-150x150.png",
    "md5": "2504f9fa6c801d4c9315fd6d7344c906",
    "action": "create"
  },
  {
    "path": "mstile-310x150.png",
    "md5": "14820a6c94aaa7a7f9233305a34835cd",
    "action": "create"
  },
  {
    "path": "mstile-310x310.png",
    "md5": "f232775db193c33ea76d5891edf22121",
    "action": "create"
  },
  {
    "path": "mstile-70x70.png",
    "md5": "93d85767115bdc81bc99550a68ee15e7",
    "action": "create"
  },
  {
    "path": "robots.txt",
    "md5": "fa1ded1ed7c11438a9b0385b1e112850",
    "action": "ignore"
  },
  {
    "path": "safari-pinned-tab.svg",
    "md5": "734719239fa326857b049112422dafc7",
    "action": "ignore"
  },
  {
    "path": "site.webmanifest",
    "md5": "b9aa277fcfc34c31db6c7a7ea3469b8c",
    "action": "ignore"
  },
  {
    "path": "static/css/main.61ad3429.css",
    "md5": "a5475e3bf6707c2b32880d20fad18cb6",
    "action": "create"
  },
  {
    "path": "static/css/main.61ad3429.css.map",
    "md5": "4a09cc4c96a2df65bfc8c7b6c7b3d7c5",
    "action": "create"
  },
  {
    "path": "static/js/787.cda612ba.chunk.js",
    "md5": "e16f9d67ee3df650aeeb92c666f7b183",
    "action": "create"
  },
  {
    "path": "static/js/787.cda612ba.chunk.js.map",
    "md5": "69f53b560922f6f954937aca6c073a35",
    "action": "create"
  },
  {
    "path": "static/js/main.4982a6aa.js",
    "md5": "76cc763b7049ebc2e8751a7e5de64bb6",
    "action": "create"
  },
  {
    "path": "static/js/main.4982a6aa.js.LICENSE.txt",
    "md5": "0113709fed672849d8e3bd6136b65344",
    "action": "create"
  },
  {
    "path": "static/js/main.4982a6aa.js.map",
    "md5": "1ac9f0d773760ba0356a2280c71024a9",
    "action": "create"
  },
  {
    "path": "static/media/bomb.585e455838778938e175c4311b6a9284.svg",
    "md5": "5540aa7031f7c3b7720dd15569fecb15",
    "action": "create"
  },
  {
    "path": "static/media/elipses.e1e2c11435294de336f167d28e3387f2.svg",
    "md5": "34beef7d8be2e742957783a41f8bb1e6",
    "action": "create"
  },
  {
    "path": "static/media/heart.c31d61db7c2d096bd3219a00053eca01.svg",
    "md5": "7746f5e4d82a2cf71a3d1f30fdef6ace",
    "action": "create"
  },
  {
    "path": "static/media/home.4e94b7659059a75c271100122f0b2f23.svg",
    "md5": "cfc4b2032f43ad932daaaa29251afd47",
    "action": "create"
  },
  {
    "path": "static/media/logo.5753985f6358b14bd71dac0a2953098c.svg",
    "md5": "45da38811712fc1252e8e6459c5b329c",
    "action": "create"
  },
  {
    "path": "static/media/messages.9c2a92621ab30f0780dfbfcc7af26768.svg",
    "md5": "cfd494d4bc6d15112d90b170c9ac6e61",
    "action": "create"
  },
  {
    "path": "static/media/more.e13deeada4344cadc8f349f1575607fa.svg",
    "md5": "70e07907d101e97a34c56f4c86ee115b",
    "action": "create"
  },
  {
    "path": "static/media/notifications.30f93bb0a78cc8bb07e1a283bb8a3495.svg",
    "md5": "b0be03bb6586c020faddd6004362e327",
    "action": "create"
  },
  {
    "path": "static/media/profile.a195fff06191f3e91d26f8f44f495b0a.svg",
    "md5": "3433d26c7515ba82ff82d96749f37f6c",
    "action": "create"
  },
  {
    "path": "static/media/reply.e855b43c7d756ec100f0520b73df4964.svg",
    "md5": "a597004ebc0bbfcb8381294c50f8c51e",
    "action": "create"
  },
  {
    "path": "static/media/repost.3d8455b75243ae9c8440ddecb016ce72.svg",
    "md5": "7ef1e7909877e4829c7f76dc845c8500",
    "action": "create"
  },
  {
    "path": "static/media/share.858c53d43c95f51422eb938be3942086.svg",
    "md5": "f645a05e1019f2175e1eba5956f4cfb9",
    "action": "create"
  }
]
```