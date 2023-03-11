# Week 3 — Decentralized Authentication


# Authenticate with Amazon Cognito

## Create Cognito:
<img src="assets/Week3/cognito/1 create use pool.png">

## Password Security
<img src="assets/Week3/cognito/2 password security.png">

## MFA costs extra:
<img src="assets/Week3/cognito/3 mfa .png">

## We want this:
<img src="assets/Week3/cognito/5 this.png">


## SMS will cost EXTRA:
<img src="assets/Week3/cognito/6 this ok for costs no sms.png">
<br>


## Pick the attributes
Will redo the pool with preferred username included.

<img src="assets/Week3/cognito/7 image is enough.png">


## Pick the domain or accept Default:
<img src="assets/Week3/cognito/8- step 4 custom reply with domain.png">


## Name your Pool &:
Cognito UI is Nah.




<img src="assets/Week3/cognito/9 ui is naaaahnaah.png">




## I went with this Indeed:
<img src="assets/Week3/cognito/10 he clicked other and said public .png">


## First App User Created, Myself
<img src="assets/Week3/cognito/9 done .png">

---

# Amplify Integration

<img src="assets/Week3/Amplify/1 install sdk and include in json with --save tag because we need it always not just for dev.png">

## Config Cognito Env:
<img src="assets/Week3/Amplify/2 configure Amplify vars.png">

## User pools ID:
<img src="assets/Week3/Amplify/3 resolving code and include required.png">

## App client IP:
<img src="assets/Week3/Amplify/4 another value.png">

## A missing one:
<img src="assets/Week3/Amplify/5 no trap.png">

## Coding.
<img src="assets/Week3/Amplify/6 look at the code.png">

## See this?
<img src="assets/Week3/Amplify/7 oh my eyes.png">

## Outplay:
<img src="assets/Week3/Amplify/8 ok thats bette.png">

## Navigating codebase:
<img src="assets/Week3/Amplify/9 ctrl ALT GOOOO.png">


## Critical Thinking:
<img src="assets/Week3/Amplify/10 update amplify instead of cookies in profileinfo.png">

## However, blank:
<img src="assets/Week3/Amplify/11 awesome itss blank.png">

## Shooting issues:
<img src="assets/Week3/Amplify/12 troubleshooting.png">

## Analyzing situation
<img src="assets/Week3/Amplify/13 hm check from frontshell they are sett.png">

## Issue found:
<img src="assets/Week3/Amplify/14 should be same.png">

## Strategic decision-making:

<img src="assets/Week3/Amplify/15 solving.png">

## Solved:
<img src="assets/Week3/Amplify/16 its back ok.png">


## Authentication Set up:
<img src="assets/Week3/Amplify/17 sign in page.png">

## Coding requirements:
<img src="assets/Week3/Amplify/18 change it to email yea.png">


## System Established:
<img src="assets/Week3/Amplify/19 user do not exist.png">

## Navigating complexity:
<img src="assets/Week3/Amplify/20 another.png">

## Troubleshooting Signin page:
<img src="assets/Week3/Amplify/21 touchpoint.png">

## Touchpoints:
<img src="assets/Week3/Amplify/22 touchpoint.png">

<img src="assets/Week3/Amplify/23 deep foucs on doing this.png">

## Sign in Setup:

<img src="assets/Week3/Amplify/24 yay.png">

## Creating myself in Cognito & Strong PW:
<img src="assets/Week3/Amplify/26 set pw strong.png">


## Additionnal Client Infos:
<img src="assets/Week3/Amplify/27 user.png">


## User created:
<img src="assets/Week3/Amplify/28 user created.png">


> required after creation:

```
aws cognito-idp admin-set-user-password \
  --user-pool-id <your-user-pool-id> \
  --username <username> \
  --password <password> \
  --permanent
```

## Enforcing PW Status:
<img src="assets/Week3/Amplify/29 enfocing pw for user.png">


## Cognito Status Done:
<img src="assets/Week3/Amplify/30 cognito status.png">

## Logging Success BUT?
<img src="assets/Week3/Amplify/32 working.png">

> will see.

---

# User recreation with attributes:

<img src="assets/Week3/Complete/1 cognito again with preffered name.png">

## Specify new user pool:
<img src="assets/Week3/Complete/2 specify new user pool as required.png">


## New client name:
<img src="assets/Week3/Complete/3 client name.png">


## Specify new connection:
<img src="assets/Week3/Complete/4 specify new connection.png">

## New user validate:
<img src="assets/Week3/Complete/5- creation of user new .png">

## Public Client:
<img src="assets/Week3/Complete/6 requires mroe.png">


## Enforcing PW:
<img src="assets/Week3/Complete/7 new pool new user force pw etc.png">

## Enforced:
<img src="assets/Week3/Complete/8 proof after running that command.png">

## Had to specify this:
<img src="assets/Week3/Complete/9 had to specify this.png">

## Overall users:
<img src="assets/Week3/Complete/10 current users.png">

## Verified User:
<img src="assets/Week3/Complete/11 cbn.png">

## Self-Digital Confirmation:
<img src="assets/Week3/Complete/15 auth confirm.png">

## Home page Authentication:
<img src="assets/Week3/Complete/16 auth home plus reply why not.png">

## Recover Page setup:
<img src="assets/Week3/Complete/17 recover page.png">

## The pre-results:
<img src="assets/Week3/Complete/18 the right result before fixing the preferedd name.png">

## Internal User stats:
<img src="assets/Week3/Complete/19 wasaup.png">

<img src="assets/Week3/Complete/20 all set.png">

## Cruddur delivered:
<img src="assets/Week3/Complete/21 the result!.png">


---

# Client Sign up

## Code Sign up page:
<img src="assets/Week3/Complete/Signup/1 add name.png">

## Innovative thinking

<img src="assets/Week3/Complete/Signup/2 add username.png">


## Parameters:
<img src="assets/Week3/Complete/Signup/3 code artist.png">


## Confirmation page:
<img src="assets/Week3/Complete/Signup/4 confirmation page.png">


## Sign up UI with additionnal inputs:
<img src="assets/Week3/Complete/Signup/5 sign up ui with the required additional inputs.png">

## Error:
<img src="assets/Week3/Complete/Signup/6 hmm error.png">


## Resilience in the face of challenges
<img src="assets/Week3/Complete/Signup/7 troubleshoot.png">


<img src="assets/Week3/Complete/Signup/8 this is ok.png">


## This is missing: 
<img src="assets/Week3/Complete/Signup/9 for real tho OMG.png">


---

# Recreation of USER Pool N3: 

## Deleting existing clients:
<img src="assets/Week3/Complete/Signup/userpool again/1- bye user pool n2.png">

## Only email config:
<img src="assets/Week3/Complete/Signup/userpool again/2 he only meant to do that LOL.png">

## Sign up testing Confirmation Email:
<img src="assets/Week3/Complete/Signup/userpool again/3 sign up.png">


## Email Confirmed:
<img src="assets/Week3/Complete/Signup/userpool again/5 Hm we can custom this from cognito (2).jpg" width="300">


## Inside, we can custom this:

<img src="assets/Week3/Complete/Signup/userpool again/6 Hm we can custom this from cognito (1).jpg" width="300">


## Confirming:
<img src="assets/Week3/Complete/Signup/userpool again/4 email sent.png">




## Confirmed:

<img src="assets/Week3/Complete/Signup/userpool again/6-6 confirmed.png">


## Sign in after confirmation:
<img src="assets/Week3/Complete/Signup/userpool again/7 sign in after confirmation.png">




## Recover Notification:

<img src="assets/Week3/Complete/Signup/userpool again/8r.jpg" width="300">

## Password Recovery:


<img src="assets/Week3/Complete/Signup/userpool again/8 recover pw.png">

## Recovered Client's Account:
<img src="assets/Week3/Complete/Signup/userpool again/9 perfect.png">

## Client Recovered Connection✔️:
<img src="assets/Week3/Complete/Signup/userpool again/10.png">


> we better then login users after they confirm directly.


---

# Cognito Jason Web Token — Construction


## securing front:
<img src="assets/Week3/Cognito JWT/1 this we have to pass it.png">


<img src="assets/Week3/Cognito JWT/2 here, front.png">


## Passing headers with authorization as called in homefeedpage:
<img src="assets/Week3/Cognito JWT/3 passing headers with authorization as called in homefeedpage.png">

## Blank:
<img src="assets/Week3/Cognito JWT/4 blank screen error.png">

## Shooting this:
<img src="assets/Week3/Cognito JWT/4 trying to solve importing sys.png">


## And this:
<img src="assets/Week3/Cognito JWT/5 and adding stdout.png">

## Yet:
<img src="assets/Week3/Cognito JWT/6 no...png">

## Trying to force flush:
<img src="assets/Week3/Cognito JWT/7 tried to force flush.png">

# Not yet:
<img src="assets/Week3/Cognito JWT/8 no again.png">

## Trying App logger:
<img src="assets/Week3/Cognito JWT/9 trying app logger instead.png">

## Still:
<img src="assets/Week3/Cognito JWT/10 no...png">

## Checking  the error:
<img src="assets/Week3/Cognito JWT/11 out of the topic error.png">


## We back with better error:
<img src="assets/Week3/Cognito JWT/11-2 better error .png">

## CORS Policy
<img src="assets/Week3/Cognito JWT/12 hm cors policy.png">

## Debug instead of info:
<img src="assets/Week3/Cognito JWT/13 debu instead of info hm.png">


## Up again:
<img src="assets/Week3/Cognito JWT/14 cbn.png">

## Where is my token:
<img src="assets/Week3/Cognito JWT/15 these should print my token bro i dont see it.png">



---

# Flask AWS Cognito Librairy —

## Librairy source code:
<img src="assets/Week3/Cognito JWT/Token/1 we may need thiscode -community driven nice.png">

## Taking the class:
<img src="assets/Week3/Cognito JWT/Token/2 take the class.png">

## JWT Limits:
<img src="assets/Week3/Cognito JWT/Token/3 kk he thinks there is some limitation to that.png">

## Install the librairy:
<img src="assets/Week3/Cognito JWT/Token/4 next anyway.png">

## Learning about the librairy and its code base:
<img src="assets/Week3/Cognito JWT/Token/5 u really should know about the librairy before u install it.png">


<img src="assets/Week3/Cognito JWT/Token/6 we only need this 2 for the librairy.png">

## Adjusting the code:
<img src="assets/Week3/Cognito JWT/Token/7 adjusted as required for compose.png">

## Importing the librairy:
<img src="assets/Week3/Cognito JWT/Token/8 imported the librairy.png">

## Validating the pattern:
<img src="assets/Week3/Cognito JWT/Token/9 validate pattern.png">

## Adding auth work to backend but im getting error:
<img src="assets/Week3/Cognito JWT/Token/10 added auth work to backend but im getting error.png">

## Limited librairy:
<img src="assets/Week3/Cognito JWT/Token/11 bye limited librairy..png">
<img src="assets/Week3/Cognito JWT/Token/12 hm.png">

<img src="assets/Week3/Cognito JWT/Token/13 im just leaving you.png">

## Here we are again:
<img src="assets/Week3/Cognito JWT/Token/14 here we are again.png">

## Adding these:
<img src="assets/Week3/Cognito JWT/Token/15 We add these two.png">

## And added here:
<img src="assets/Week3/Cognito JWT/Token/16 and added here.png">

## And did this:
<img src="assets/Week3/Cognito JWT/Token/17 and do this.png">

## From here:
<img src="assets/Week3/Cognito JWT/Token/18 from here.png">

## God tier plays:
<img src="assets/Week3/Cognito JWT/Token/19 god tier plays.png">

## We doing JWT so lets make it more readable:
<img src="assets/Week3/Cognito JWT/Token/20 we doing JWT so lets make it more readable.png">

## Digging deeper:
<img src="assets/Week3/Cognito JWT/Token/21 dig it into it.png">

## Adjusting librairy:
<img src="assets/Week3/Cognito JWT/Token/22 adjust libariry name.png">

## And this:
<img src="assets/Week3/Cognito JWT/Token/23 and thisss.png">

## Passing the token:
<img src="assets/Week3/Cognito JWT/Token/24 passing the token.png">

## Its fine:
We aint changing the header.
<img src="assets/Week3/Cognito JWT/Token/25 we aint changing the header so its fine.png">

## This is not self:
<img src="assets/Week3/Cognito JWT/Token/26 it is not self we adjusted it earlier.png">

## Taking this out:
<img src="assets/Week3/Cognito JWT/Token/28 take this out.png">

## As well as this:
<img src="assets/Week3/Cognito JWT/Token/29 and this.png">

## We dont know what this class really about:
<img src="assets/Week3/Cognito JWT/Token/30 we dont know what this class really about.png">

## Maybe we can call it here, i mean in ruby nah but maybe in py:
<img src="assets/Week3/Cognito JWT/Token/31 maybe we can call it here, i mean in ruby nah but maybe in py.png">

## Import but this token service makes no sense:
<img src="assets/Week3/Cognito JWT/Token/32 import but this token service makes no sense.png">

## There is no data in here:
<img src="assets/Week3/Cognito JWT/Token/33 there is no data i need from here.png">

## The user pool is well set:
<img src="assets/Week3/Cognito JWT/Token/34 the user pool is well set.png">

## The client pool is set as well:
<img src="assets/Week3/Cognito JWT/Token/35 client pool is also well set.png">

## Errors:
<img src="assets/Week3/Cognito JWT/Token/37 something is wrong.png">

- [Troubleshoot Completion](#revert-back-to-jwt-debugging)

# Gitpod is down
<img src="assets/Week3/Codespaces/0- gitpod downbilling.png">

## Configuring codespaces:
<img src="assets/Week3/Codespaces/1 onboarding to codespaces and setup devcontainer json file .png">

## Settin AWS CLI:
<img src="assets/Week3/Codespaces/2 setting aws cli  access id.png">

## Secret Key:
<img src="assets/Week3/Codespaces/3 secret key.png">

## Region:
<img src="assets/Week3/Codespaces/4 region.png">

## Overall Env var:
<img src="assets/Week3/Codespaces/5 overall nice.png">

## Setup port for front:
<img src="assets/Week3/Codespaces/5-5 set up port env for frontend.png">

## Env var port again:
<img src="assets/Week3/Codespaces/5-5 set up ports env.png">

## All set:
<img src="assets/Week3/Codespaces/6 env var set.png">

## Reloading:
<img src="assets/Week3/Codespaces/6 reload required.png">

## Rebuilding container:
<img src="assets/Week3/Codespaces/7 rebuild container since its diff workplace and workspace.png">

## Innovative thinking while loading:
<img src="assets/Week3/Codespaces/8 rebuilding loading........png">

## AWS is authenticated for the time number too much:
<img src="assets/Week3/Codespaces/9 aws authenticated.png">

## Container Launch:
<img src="assets/Week3/Codespaces/10 after launchin the containers, hm why .png">

## Codespaces is set:
<img src="assets/Week3/Codespaces/11 cbn codespaces set.png">

# Codespaces Down - Moving to local


## AWS CLI:
<img src="assets/Week3/docker-local/1 back vs code, set up aws.png">

## Secret from UI
<img src="assets/Week3/docker-local/2 secret.png">

## Done:
<img src="assets/Week3/docker-local/3.png">

## Install AWS EXE:
<img src="assets/Week3/docker-local/5 aws cli.png">

## Checking Availability:
<img src="assets/Week3/docker-local/6 cbn aws vscode.png">

## Env var:
<img src="assets/Week3/docker-local/7 set up env var.png">

## Hm, i dont see:
<img src="assets/Week3/docker-local/8 i dont see do youuu.png">

## Exported, worked:
<img src="assets/Week3/docker-local/9 all good all set i see now.png">

## That's why we document our stuff:
<img src="assets/Week3/docker-local/10 thats why we document our stuff officially authenticated.png">

## Depedency requirements:
<img src="assets/Week3/docker-local/11 requires npm scripts.png">

## Satisfying it:
<img src="assets/Week3/docker-local/12 doing the require.png">

## Launching Docker local:
<img src="assets/Week3/docker-local/13 docker local amazing.png">

## Docker Images:
<img src="assets/Week3/docker-local/14 docker images.png">

## Available containers:
<img src="assets/Week3/docker-local/15 containers stats.png">

## Further stats:
<img src="assets/Week3/docker-local/16 running.png">

## Ops:
<img src="assets/Week3/docker-local/16 -2 but port dont work.png">

## Compose Config:
<img src="assets/Week3/docker-local/17 because diff env required in docker compose.png">

## And this:
<img src="assets/Week3/docker-local/18 and this.png">

## Close look:
<img src="assets/Week3/docker-local/19 used to work hm.png">

# Relaunching containers:
<img src="assets/Week3/docker-local/20 try to clear caches.png">

## Great News:
We are back to the exact error before running out of credit in gitpod as well as moving to codespaces which run of space due to high volume of journal assets.
<img src="assets/Week3/docker-local/21env is set (this is good )we back to the latest error we had before changing env.png">


# Revert back to JWT Debugging

[JWT Intial work](#cognito-jason-web-token--construction)

## Backend Logs:
<img src="assets/Week3/backend logs.png">

## Browser:
<img src="assets/Week3/more.png">

## Token issue:
<img src="assets/Week3/tokenissue.png">


## Solved:
<img src="assets/Week3/solved here.png">

## However token is not passed: 

<img src="assets/Week3/but token is not apssed.png">






---



# Week Three To-Do & Student Status
| Task                                        | Status |
|---------------------------------------------|--------|
| Watched Ashish's Week 3                     |   ✅   |
| Watch Chirag Week 3 - Spending Considerations (Not yet posted) |   ⌛   |
| Provision via ClickOps a Amazon Cognito User Pool                      |   ✅   |
|Implement API calls to Amazon Coginto for custom login|✅|
|Install and configure Amplify client-side library for Amazon Congito|✅|
| Implement Custom Signup Page                 |   ✅   |
| Implement Custom Confirmation Page           |   ✅   |
| Implement Custom Recovery Page               |   ✅   |
| Watch about different approaches to verifying JWTs  |   ✅   |
|Verify JWT Token server side to serve authenticated API endpoints in Flask Application|⌛|



