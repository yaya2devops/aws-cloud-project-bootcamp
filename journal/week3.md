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


## Password Recovery:


<img src="assets/Week3/Complete/Signup/userpool again/8 recover pw.png">

## Recover Notification:

<img src="assets/Week3/Complete/Signup/userpool again/8r.jpg" width="300">

## Recovered Client's Account:
<img src="assets/Week3/Complete/Signup/userpool again/9 perfect.png">

## Client Recovered Connection:
<img src="assets/Week3/Complete/Signup/userpool again/10.png">


> we better then login users after they confirm directly.


---

# Cognito Jason Web Token — Construction



<img src="assets/Week3/Cognito JWT/1 this we have to pass it.png">


<img src="assets/Week3/Cognito JWT/2 here, front.png">


<img src="assets/Week3/Cognito JWT/3 passing headers with authorization as called in homefeedpage.png">


<img src="assets/Week3/Cognito JWT/4 blank screen error.png">

<img src="assets/Week3/Cognito JWT/4 trying to solve importing sys.png">



<img src="assets/Week3/Cognito JWT/5 and adding stdout.png">


<img src="assets/Week3/Cognito JWT/6 no...png">


<img src="assets/Week3/Cognito JWT/7 tried to force flush.png">


<img src="assets/Week3/Cognito JWT/8 no again.png">


<img src="assets/Week3/Cognito JWT/9 trying app logger instead.png">


<img src="assets/Week3/Cognito JWT/10 no...png">


<img src="assets/Week3/Cognito JWT/11 out of the topic error.png">



<img src="assets/Week3/Cognito JWT/11-2 better error .png">


<img src="assets/Week3/Cognito JWT/12 hm cors policy.png">


<img src="assets/Week3/Cognito JWT/13 debu instead of info hm.png">


<img src="assets/Week3/Cognito JWT/14 cbn.png">


<img src="assets/Week3/Cognito JWT/15 these should print my token bro i dont see it.png">



---

## Flask AWS Cognito Librairy — Construction

<img src="assets/Week3/Cognito JWT/Token/1 we may need thiscode -community driven nice.png">
<img src="assets/Week3/Cognito JWT/Token/2 take the class.png">
<img src="assets/Week3/Cognito JWT/Token/3 kk he thinks there is some limitation to that.png">
<img src="assets/Week3/Cognito JWT/Token/4 next anyway.png">
<img src="assets/Week3/Cognito JWT/Token/5 u really should know about the librairy before u install it.png">
<img src="assets/Week3/Cognito JWT/Token/6 we only need this 2 for the librairy.png">
<img src="assets/Week3/Cognito JWT/Token/7 adjusted as required for compose.png">
<img src="assets/Week3/Cognito JWT/Token/8 imported the librairy.png">
<img src="assets/Week3/Cognito JWT/Token/9 validate pattern.png">
<img src="assets/Week3/Cognito JWT/Token/10 added auth work to backend but im getting error.png">
<img src="assets/Week3/Cognito JWT/Token/11 bye limited librairy..png">
<img src="assets/Week3/Cognito JWT/Token/12 hm.png">
<img src="assets/Week3/Cognito JWT/Token/13 im just leaving you.png">
<img src="assets/Week3/Cognito JWT/Token/14 here we are again.png">
<img src="assets/Week3/Cognito JWT/Token/15 We add these two.png">
<img src="assets/Week3/Cognito JWT/Token/16 and added here.png">
<img src="assets/Week3/Cognito JWT/Token/17 and do this.png">
<img src="assets/Week3/Cognito JWT/Token/18 from here.png">
<img src="assets/Week3/Cognito JWT/Token/19 god tier plays.png">
<img src="assets/Week3/Cognito JWT/Token/20 we doing JWT so lets make it more readable.png">
<img src="assets/Week3/Cognito JWT/Token/21 dig it into it.png">
<img src="assets/Week3/Cognito JWT/Token/22 adjust libariry name.png">
<img src="assets/Week3/Cognito JWT/Token/23 and thisss.png">
<img src="assets/Week3/Cognito JWT/Token/24 passing the token.png">
<img src="assets/Week3/Cognito JWT/Token/25 we aint changing the header so its fine.png">
<img src="assets/Week3/Cognito JWT/Token/26 it is not self we adjusted it earlier.png">
<img src="assets/Week3/Cognito JWT/Token/28 take this out.png">
<img src="assets/Week3/Cognito JWT/Token/29 and this.png">
<img src="assets/Week3/Cognito JWT/Token/30 we dont know what this class really about.png">
<img src="assets/Week3/Cognito JWT/Token/31 maybe we can call it here, i mean in ruby nah but maybe in py.png">
<img src="assets/Week3/Cognito JWT/Token/32 import but this token service makes no sense.png">
<img src="assets/Week3/Cognito JWT/Token/33 there is no data i need from here.png">
<img src="assets/Week3/Cognito JWT/Token/34 the user pool is well set.png">
<img src="assets/Week3/Cognito JWT/Token/35 client pool is also well set.png">

## Errors:
<img src="assets/Week3/Cognito JWT/Token/37 something is wrong.png">









---

