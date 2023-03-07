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


<img src="assets/Week3/Amplify/2 configure Amplify vars.png">

<img src="assets/Week3/Amplify/3 resolving code and include required.png">

<img src="assets/Week3/Amplify/4 another value.png">

<img src="assets/Week3/Amplify/5 no trap.png">

<img src="assets/Week3/Amplify/6 look at the code.png">

<img src="assets/Week3/Amplify/7 oh my eyes.png">

<img src="assets/Week3/Amplify/8 ok thats bette.png">

<img src="assets/Week3/Amplify/9 ctrl ALT GOOOO.png">

<img src="assets/Week3/Amplify/10 update amplify instead of cookies in profileinfo.png">

<img src="assets/Week3/Amplify/11 awesome itss blank.png">

<img src="assets/Week3/Amplify/12 troubleshooting.png">

<img src="assets/Week3/Amplify/13 hm check from frontshell they are sett.png">

<img src="assets/Week3/Amplify/14 should be same.png">

<img src="assets/Week3/Amplify/15 solving.png">
<img src="assets/Week3/Amplify/16 its back ok.png">

<img src="assets/Week3/Amplify/17 sign in page.png">

<img src="assets/Week3/Amplify/18 change it to email yea.png">

<img src="assets/Week3/Amplify/19 user do not exist.png">

<img src="assets/Week3/Amplify/20 another.png">

<img src="assets/Week3/Amplify/21 touchpoint.png">

<img src="assets/Week3/Amplify/22 touchpoint.png">

<img src="assets/Week3/Amplify/23 deep foucs on doing this.png">

<img src="assets/Week3/Amplify/24 yay.png">

<img src="assets/Week3/Amplify/26 set pw strong.png">

<img src="assets/Week3/Amplify/27 user.png">

<img src="assets/Week3/Amplify/28 user created.png">

```
aws cognito-idp admin-set-user-password \
  --user-pool-id <your-user-pool-id> \
  --username <username> \
  --password <password> \
  --permanent
```

<img src="assets/Week3/Amplify/29 enfocing pw for user.png">

<img src="assets/Week3/Amplify/30 cognito status.png">

<img src="assets/Week3/Amplify/32 working.png">


---



<img src="assets/Week3/Complete/1 cognito again with preffered name.png">

<img src="assets/Week3/Complete/2 specify new user pool as required.png">


<img src="assets/Week3/Complete/3 client name.png">


<img src="assets/Week3/Complete/4 specify new connection.png">


<img src="assets/Week3/Complete/5- creation of user new .png">


<img src="assets/Week3/Complete/6 requires mroe.png">


<img src="assets/Week3/Complete/7 new pool new user force pw etc.png">

<img src="assets/Week3/Complete/8 proof after running that command.png">

<img src="assets/Week3/Complete/9 had to specify this.png">

<img src="assets/Week3/Complete/10 current users.png">

<img src="assets/Week3/Complete/11 cbn.png">

<img src="assets/Week3/Complete/15 auth confirm.png">

<img src="assets/Week3/Complete/16 auth home plus reply why not.png">

<img src="assets/Week3/Complete/17 recover page.png">

<img src="assets/Week3/Complete/18 the right result before fixing the preferedd name.png">

<img src="assets/Week3/Complete/19 wasaup.png">

<img src="assets/Week3/Complete/20 all set.png">

<img src="assets/Week3/Complete/21 the result!.png">


---

<img src="assets/Week3/Complete/Signup/1 add name.png">

<img src="assets/Week3/Complete/Signup/2 add username.png">


<img src="assets/Week3/Complete/Signup/3 code artist.png">


<img src="assets/Week3/Complete/Signup/4 confirmation page.png">


<img src="assets/Week3/Complete/Signup/5 sign up ui with the required additional inputs.png">


<img src="assets/Week3/Complete/Signup/6 hmm error.png">


<img src="assets/Week3/Complete/Signup/7 troubleshoot.png">


<img src="assets/Week3/Complete/Signup/8 this is ok.png">


<img src="assets/Week3/Complete/Signup/9 for real tho OMG.png">


---

# The damn part: 

<img src="assets/Week3/Complete/Signup/userpool again/1- bye user pool n2.png">

<img src="assets/Week3/Complete/Signup/userpool again/2 he only meant to do that LOL.png">

<img src="assets/Week3/Complete/Signup/userpool again/3 sign up.png">





<img src="assets/Week3/Complete/Signup/userpool again/4 email sent.png">


<img src="assets/Week3/Complete/Signup/userpool again/5 Hm we can custom this from cognito (2).jpg">


<img src="assets/Week3/Complete/Signup/userpool again/6 Hm we can custom this from cognito (1).jpg">


<img src="assets/Week3/Complete/Signup/userpool again/6-6 confirmed.png">


<img src="assets/Week3/Complete/Signup/userpool again/7 sign in after confirmation.png">


<img src="assets/Week3/Complete/Signup/userpool again/8r.jpg">


<img src="assets/Week3/Complete/Signup/userpool again/8 recover pw.png">


<img src="assets/Week3/Complete/Signup/userpool again/9 perfect.png">

## Let's go:
<img src="assets/Week3/Complete/Signup/userpool again/10.png">


> we better then login users after they confirm directly!











---


# Week Three To-Do & Student Status


---


# Homework Challenge & Student Status


