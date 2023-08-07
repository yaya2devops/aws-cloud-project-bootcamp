# Week 3 — Decentralized Authentication

Traditional authentication systems are centralized and rely on a single point of failure which makes them more vulnerable to cyberattacks. Decentralized authentication is a more secure and private alternative that does not rely on a central authority, welcome to week three.

By the end of this, users should have complete ownership of their identities and control how they are shared. You can be confident that your identities are secure and that your data is not being shared without your consent.

## Week Three Main Tasks
We'll be onboarding the app to a decentralized authentication system on the aws platform and we'll show you exactly how.

- [Compressing  Protocols](#compressing--protocols)
- [App User Authentication](#yacrud-user-authentication)
  - [AWS Decentralized Authentication Solution](#aws-decentralized-authentication-solution)
    - [Create Amazon Cognito User Pool](#create-amazon-cognito-user-pool)
- [Client-Side Integration with Amplify](#client-side-integration-with-amplify)
  - [Step 1: Install and Configure Amplify](#step-1-install-and-configure-amplify)
  - [Step 2: Authentication As Code](#step-2-authentication-as-code)
  - [Step 3: Creating a Sign-in Page](#step-3-creating-a-sign-in-page)
  - [Step 4: Manual Sign-Ins Tests](#step-4-manual-sign-ins-tests)
  - [Step 5: Creating Sign-Up Page](#step-5-creating-sign-up-page)
  - [Step 6: Creating Confirmation Page](#step-6-creating-confirmation-page)
  - [Step 7: Testing the Confirmation Page](#step-7-testing-the-confirmation-page)
  - [Step 8: Creating Recovery Page](#step-8-creating-recovery-page)
  - [Step 9: Testing Recovery Page](#step-9-testing-recovery-page)

# Compressing Protocols

Authentication protocols are a set of rules that allow two parties to verify each other's identities, ensuring secure online transactions and protecting users' data. 

Authentication protocols have evolved over time to address security and usability challenges. 

Following SAML to 2005, the W3C released the OpenID specification, which is a standard for decentralized authentication. OpenID has been widely adopted, and it is now one of the most popular methods of decentralized authentication.

| Protocol        | Release | Description              |
|-----------------|:--------------:|---------------|
| **SAML 1.0**        | 2002         | Allows users to be authenticated and authorized across multiple domains.                       |
| **SAML 2.0**        | 2005         | A more secure version for exchanging authentication and authorization information.              |
| **OpenID**          | 2005         | A simple and easy-to-use protocol for single sign-on.                                          |
| **OAuth 1.0**       | 2007         | Allowed third-party apps to access protected resources on behalf of users but was complex and less secure. |
| **OAuth 2.0**       | 2012         | Improved OAuth 1.0 with a simpler and more secure protocol, becoming the most widely used today. |
| **OpenID Connect**  | 2015         | A more advanced protocol that builds on top of OAuth 2.0 to provide SSO and access control.     |

## Protocols and Use Cases

Below, I will outline **major use cases** and recommend the suitable for each scenario, with a particular focus on two dominant protocols.  **OAuth** use cases can also be applied with the more preferable OpenID Connect.

### **OAuth 2.0**
- **Social Login**: Social media platform allows sign-in via Facebook, Google, or Twitter credentials.
- **API Access**: Cloud storage provider grants third-party app access to APIs without sharing credentials.
- **Mobile Apps**: Banking app authenticates users using existing bank credentials.
- **Web Applications**: E-commerce website enables sign-in using credit card credentials.

### **SAML 2.0**
- **Single Sign-On**: University enables students to log in to websites and apps with university credentials.
- **Federation**: Company federates security domains with partners, allowing access using their own credentials.
- **Authorization**: Healthcare organization exchanges authorization info with patients to control access to medical records.

Authentication protocols have come a long way, with OAuth 2.0 as the versatile standard, SAML 2.0 for specialized scenarios, and OIDC extending OAuth with essential authentication features.
- SAML protocl is **XML-based**.
- OAuth is *Restful*, **JSON protocol**.
- OpenID is *URI-based*, **JSON	protocol**.

***OIDC* Connect builds on OAuth 2.0 for enhanced authentication and security,**

- **Userinfo Endpoint:** Applications can request user information (name, email, etc.).
- **ID Tokens:** Signed JSON objects with user info, issuer, and audience.
- **JWT:** Uses JSON Web Tokens for secure representation of user identity and authorization.

# Yacrud User Authentication

[**OpenID Connect**](https://docs.aws.amazon.com/cognito/latest/developerguide/open-id.html) has become the prevailing protocol among leading Fortune companies for internal authorization and authentication including Amazon, Google and Microsoft. 

When a user tries to access an **`OpenID-compliant application`**
- **`App will redirect`** the user to the **identity provider's `login page`**.
- The **`identity provider`** will **`authenticate` the user** and **return an `authentication token`** to the application.
- The application can then **use the `authentication` token to access `protected resources`**.
```yaml
    User                OpenID-Compliant          Identity Provider          Application
     |                       Cruddur                    |                       | 
     |------------ Redirect to Login Page ------------->|                       | Y
     |                                                  |                       | A
     |                <------- Login Page --------------|                       | Y
     |                                                  |                       | A
     |----- Redirect with Auth Token (after login)----->|                       | 2
     |                                                  |                       | D
     |                      <------- Auth Token --------|                       | E
     |                                                  |                       | V
     |------------------- Access Protected Resources -------------------------->| O
     |                                                  |                       | P
     |<----- Respond with Protected Resource Data ------|                       | S
     |------------ Sign Out Operation------------------>|                       | 
```
Moreover, OIDC is offered as a service to customers, delivering to you a seamless and dependable authentication solutions of the future.

## AWS Decentralized Authentication Solution
AWS Cognito, The OIDC standard, is a fully managed service provided that enables developers to add user sign-up, sign-in, and access control functionalities to their applications. 

It offers a scalable and secure solution for handling user authentication and identity management, making it easier to manage user data and access across various devices and platforms.
```yaml
User --> [AWS Cognito] --(OAuth 2.0, OpenID Connect)--> [Identity Pool] --> [Federated Identities] --> [AWS Services, Yacrud, Products..]
```
We will leverage the power of AWS Cognito to implement decentralized authentication, as well as enable smooth user sign-in, sign-up, and password recovery processes.


### Create Amazon Cognito User Pool
1. aws to the [Cognito](https://console.aws.amazon.com/cognito/) in the console.
2. Click **Create a user pool**.
3. In the **Authentication providers** section, select **Cognito user pool**.
4. In the **Cognito user pool sign-in options** section, select **Email**. `Click Next`.
5. In the **Security requirements** section, select **No MFA**.
6. In the **User account recovery** section, leave the default settings. `Click Next`.
7. In the **Required attributes** section, select **name** and **preferred_username**. `Click Next`.
8.  In the **Email delivery** section, select **Send email with Cognito**. `Click Next`.
9.  Enter a **User pool name**.
10. In the **App type** section, select **Public Client** and set a **App client name**. `Click Next`.
11. Review the settings and click **Create User Pool**.

The user pool will be created and you will be able to retrieve the user pool ID and app client ID.

<img src="assets/Week3/cognito/9 done .png">

**NOTES:**

* The `name` and `preferred_username` attributes cannot be changed after creation.
* The `Send email with Cognito` option uses Amazon SNS to send emails.
* There is a limit on the number of emails that can be sent for free each month.
* The `Use the Cognito Hosted UI` option should not be used. It is not good looking.
* AWS Cognito allows `IdP Integrations`.
*  `Security requirements with MFA` is recommended but cost more.

# Client-Side Integration with Amplify
Amplify enables conditional rendering of elements and data based on whether the user is logged in or logged out.

Amplify is employed with Amazon Cognito for client-side authentication and enable API calls for custom *login*, *signup*, and *recovery* functionality. 

**The following source files require authentication implementations.**
| Source File                                  | Description                                     |
|-------------------------------------------|--------------------------------------------------------------|
| `app.py`          | Backend configurations for amplify for cognito.  |
| `docker-compose.yml`          | Cognito Environment variables and app local testing.  |
| `HomeFeedPage.js`          | Page responsible for displaying the home feed content.  |
| `ProfileInfo.js`      | Component for displaying user profile information.      |
| `SigninPage.js`            | Page for user sign-in functionality.                    |
| `SignupPage.js`           | Page for user registration.                              |
| `DesktopNavigation.js` | Component to conditionally show links based on login status. |
| `ConfirmationPage.js`     | Page for confirming user accounts and resending codes.   |
| `RecoverPage.js`           | Page for user password recovery.                         |

Leveraging Cognito with Amplify, we can achieve a secure and efficient authentication for our application.

## Step 1: Install and Configure Amplify
1. Install Amplify

Run the following command in the frontend-react-js path to install the Amplify client-side library for Amazon Cognito
```
npm i aws-amplify --save
```
This will automatically update `package.json` and `package-lock.json` to include the Amplify package.

2. Configure Amplify
In `frontend-react-js/src/App.js`, add the following import:

```js
import { Amplify } from 'aws-amplify';
```
3. Below the import statements, configure Amplify with the necessary environment variables:
```js
Amplify.configure({
  AWS_PROJECT_REGION: process.env.REACT_APP_AWS_PROJECT_REGION,
  aws_cognito_region: process.env.REACT_APP_AWS_COGNITO_REGION,
  aws_user_pools_id: process.env.REACT_APP_AWS_USER_POOLS_ID,
  aws_user_pools_web_client_id: process.env.REACT_APP_CLIENT_ID,
  oauth: {},
  Auth: {
    region: process.env.REACT_APP_AWS_PROJECT_REGION,
    userPoolId: process.env.REACT_APP_AWS_USER_POOLS_ID,
    userPoolWebClientId: process.env.REACT_APP_CLIENT_ID,
  },
});
```
4. Ensure that the necessary environment variables are added to the docker-compose.yml file under the frontend section:

<img src="assets/Week3/Amplify/3 resolving code and include required.png">

```yaml
REACT_APP_AWS_PROJECT_REGION: "${AWS_DEFAULT_REGION}"
REACT_APP_AWS_COGNITO_REGION: "${AWS_DEFAULT_REGION}"
REACT_APP_AWS_USER_POOLS_ID: "${AWS_USER_POOLS_ID}"
REACT_APP_CLIENT_ID: "${CLIENT_ID}"
```
5. Also, set the user pool ID and app client ID as environment variables using the following commands:

<img src="assets/Week3/Amplify/4 another value.png">

```sh
export REACT_APP_AWS_USER_POOLS_ID=<USER_POOLS_ID>
export REACT_APP_CLIENT_ID=<APP_CLIENT_ID>
```

## Step 2: Authentication As Code

Onboarding Cognito to these pages and require users to be authenticated to view these initial pages. This provides a more secure and seamless user experience. 
- `HomeFeedPage.js` is the page where users will see their feed of posts.
- `ProfileInfo.js` is the page where users can view their personal profile information and settings.

1. Import the `Auth` module from `aws-amplify`. This module provides the functionality to interact with Cognito.
```js
import { Auth } from 'aws-amplify';
```
2. In the `HomeFeedPage.js` file, add the following code to check if the user is authenticated:

<img src="assets/Week3/Amplify/6 look at the code.png">

```js
const checkAuth = async () => {
  Auth.currentAuthenticatedUser({
    bypassCache: false,
  })
    .then((user) => {
      console.log("user", user);
      return Auth.currentAuthenticatedUser();
    })
    .then((cognito_user) => {
      setUser({
        display_name: cognito_user.attributes.name,
        handle: cognito_user.attributes.preferred_username,
      });
    })
    .catch((err) => console.log(err));
};
```
This code will first check if the user is authenticated by calling the `currentAuthenticatedUser` method. If the user is authenticated, the method will return the user's Cognito user object. The user's name and preferred username will then be set on the `setUser` function.

3. In the `ProfileInfo.js` file, replace the old `signOut` function with the following code:

<img src="assets/Week3/Amplify/9 ctrl ALT GOOOO.png">

```js
const signOut = async () => {
  try {
    await Auth.signOut({ global: true });
    window.location.href = "/";
  } catch (error) {
    console.log('error signing out: ', error);
  }
};
```
This will sign the user out of Cognito and redirect them to the home page.

## Step 3: Creating a Sign-in Page

Follow these steps to create a sign-in page using the `aws-amplify` library.
1. In the `SignInPage.js` file, import the Auth class from the `aws-amplify` package located in the pages directory.
```js
import { Auth } from 'aws-amplify';
```
2. Clear Previous Errors and Prevent Default Form Submission:
```js
setErrors("");  
event.preventDefault(); 
```
This part ensures that any previous error messages are cleared, and it prevents the default behavior of form submission, giving you control over the submission process.
```js
const onsubmit = async (event) => {
    setErrors("");
    event.preventDefault();
    
    // Rest of the code will go here...
};
```
3. Attempt User Sign-In and Handle Success:
```js
try {
    // Try user using the provided email and password
    const user = await Auth.signIn(email, password);

    // Store the user's access token securely in the browser
    localStorage.setItem("access_token", user.signInUserSession.accessToken.jwtToken);

    // Redirect the user to the main page after successful sign-in
    window.location.href = "/";
} catch (error) {
    // Errors during sign-in will be handled in the subsequent code block
}

```
4. Handle Errors and Redirect for Unconfirmed Users:
```js
} catch (error) {
    // Log the error to the console
    console.log("Error!", error);
    
    if (error.code === "UserNotConfirmedException") {
        window.location.href = "/confirm";
    }
    
    // Display the error message to the user
    setErrors(error.message);
}
```
In case of an error during sign-in, this part logs the error, checks if it's related to an unconfirmed user, and handles the redirection accordingly. It also displays the error message to the user.

5. Verify your function looking like this after replacing the `onsubmit` function to handle the submission of the sign ins data.
```js
// Handle the submission of sign-in data
const onsubmit = async (event) => {
    setErrors("");  // Clear any previous error messages
    event.preventDefault();  // Prevent the default form submission behavior
    
    try {
        // Attempt to sign in the user using the provided email and password
        const user = await Auth.signIn(email, password); 
        localStorage.setItem("access_token", user.signInUserSession.accessToken.jwtToken);

        // Redirect to the home page upon successful sign-in
        window.location.href = "/";
    } catch (error) {
        console.log("Error!", error);

        // Check if the error is due to an unconfirmed user
        if (error.code === "UserNotConfirmedException") {
            // Redirect to the confirmation page for user confirmation
            window.location.href = "/confirm";
        }
        setErrors(error.message);  // Display the error message to the user
    }
    
    return false;  // Prevent the form from submitting
};
```


## Step 4: Manual Sign-Ins Tests


1. Go to the **Sign in** page of the user pool.
2. Enter the user's email address and password.
3. Click on the **Sign in** button.

<img src="assets/Week3/Amplify/21 touchpoint.png">


**Note:** The email address will be used to verify the user's account.

#### Troubleshooting Above Error

To address the error, follow these steps:

1. Open your terminal or command prompt.
2. Execute the necessary command to reset the password for a user in AWS Cognito.

<img src="assets/Week3/Amplify/29 enfocing pw for user.png">

```
aws cognito-idp admin-set-user-password --username <username> --password <password> --user-pool-id <userpool_id> --permanent
```
- Replace `<username>` with the actual username of the user.
- Replace `<password>` with the desired new password.
- Replace `<userpool_id>` with the ID of your user pool.

#### Re-attempt Sign-In

1. After resetting the password, attempt to sign in again.

<img src="assets/Week3/Amplify/32 working.png">

2. Go to the console and see the registered user confirmed.

<img src="assets/Week3/Amplify/30 cognito status.png">

You should now be able to authenticate without encountering any errors.
### User Handle Inspection

To effectively inspect user data, follow these steps

#### Updating User Attributes
1. Navigate to the User page.
2. Click on `"Edit"` under User attributes.
3. Modify or add information to the Name and Preferred Name fields as required.
4. Save your changes.

#### Viewing Name Changes
1. Log back into the Cruddur application.
2. You will now be able to view the updated name information, reflecting the changes made in the previous step.

<img src="assets/Week3/Complete/18 the right result before fixing the preferedd name.png">

3. Re-operate and sign in the a real user.

<img src="assets/Week3/Complete/21 the result!.png">

#### Deleting User and Sign Out
1. If needed, return to the AWS Cognito dashboard.
2. Locate and delete the user.
3. Sign out of the Cruddur application to ensure a clean session.

## Step 5: Creating Sign-Up Page

1. Open the `signupPage.js` file.
2. Replace the `cookies` import with the following:
```js
import { Auth } from 'aws-amplify';
```
3. Replace the `onsubmit` event handler with the following code:
```js
const onsubmit = async (event) => {
  event.preventDefault();
  setErrors('');
  try {
    const { user } = await Auth.signUp({
      username: email,
      password: password,
     // To Be Continued
    });
    console.log(user);
    window.location.href = `/confirm?email=${email}`;
  } catch (error) {
    console.log(error);
    setErrors(error.message);
  }
  return false;
};
```
- The first line, `event.preventDefault()`, prevents the default behavior of the submit button, which would be to reload the page.
- The next line, `setErrors('')`, clears the `errors` state variable.


The goal is to keep your users signed in and engaged on the platform once they've logged in.

4. Then the `autoSignIn` Object comes in
```js
      autoSignIn: { 
        // optional - enables auto sign in after user is confirmed
        enabled: true,
      }
```
  - `autoSignIn`: An object that specifies whether the user should be automatically signed in after they are created.

5. Add Cruddur User Attributes using the following code.
```js
  try {
    const { user } = await Auth.signUp({
      attributes: {
        name: name,
        email: email,
        preferred_username: username,
      },
```
  - `attributes`: An object that contains additional attributes about the user, such as their name and email address.

6. The code should look like this.

```js
const onsubmit = async (event) => {
  event.preventDefault();
  setErrors('');
  try {
    const { user } = await Auth.signUp({
      username: email,
      password: password,
      attributes: {
        name: name,
        email: email,
        preferred_username: username,
      },
      autoSignIn: { 
        // optional - enables auto sign in after user is confirmed
        enabled: true,
      }
    });
    console.log(user);
    window.location.href = `/confirm?email=${email}`;
  } catch (error) {
    console.log(error);
    setErrors(error.message);
  }
  return false;
};
```
- If the sign up is successful, the `try` block will log the user object and redirect the user to the confirmation page. The `console.log()` function prints the user object to the console. The `window.location.href` function sets the URL of the current window to the confirmation page.
- If the sign up fails, the `catch` block will log the error and set the `errors` state variable to the error message. The `console.log()` function - prints the error to the console. The `setErrors()` function sets the `errors` state variable to the error message.
5. Save the Sign-Up page and verify it.

<img src="assets/Week3/Complete/Signup/userpool again/3 sign up.png">

Once you have created the page it will now use the AWS Amplify library to sign up users.

## Step 6: Creating Confirmation Page

1. In the `ConfirmationPage.js` file, ensure you have the necessary import statement at the beginning of your code:
```js
import { Auth } from 'aws-amplify';
```
1. Locate the `resend_code` function and add the new code to handle Confirmation.
```js
const resend_code = async (event) => {
  setErrors('');
  try {
     # To Be Continued.
  } catch (err) {
    # To Be Continued
  }
};
```

3. Inside the try block, you will add the code to resend the activation code using AWS Amplify Auth. This code ensures that the activation code is resent to the user's email for confirmation.
```js
  try {
    // Resend the activation code using AWS Amplify Auth
    await Auth.resendSignUp(email);
    console.log('Activation code resent successfully');
    setCodeSent(true);
```
Now, let's handle the specific error cases that might occur during the resend process. 

4. In the catch block, you can add conditional statements to provide meaningful error messages based on the type of error. This helps guide the user and provide relevant feedback.
```js
    catch (err) {
    // Handle errors during resend process
    console.log(err);
    if (err.message === 'Username cannot be empty') {
      setErrors("Please provide an email to resend the Activation Code.");
    } else if (err.message === "Username/client id combination not found.") {
      setErrors("The provided email is either invalid or cannot be found.");
    }
```
You can leave the rest of the catch block as it is for now, and we will proceed to completing the error handling in the next step.

5. Locate the existing `onsubmit` function in your code.

This function is responsible for confirming the sign-up process and handling any errors that might occur.

6. Replace the existing onsubmit function with the new code provided below.
```js
const onsubmit = async (event) => {
    event.preventDefault();
    setErrors('');
    try {
      // Confirm the sign-up using AWS Amplify Auth
      await Auth.confirmSignUp(email, code);
      // Redirect the user to the homepage upon successful confirmation
      window.location.href = "/";
    } catch (error) {
      // Handle errors during confirmation
      setErrors(error.message);
    }
    return false;
}
```
This updated code ensures smooth handling of confirmation and error feedback.

## Step 7: Testing the Confirmation Page

After incorporating these modifications, proceed through the following steps to ensure the Confirmation Page operates as intended:

1. Refresh the Cruddur webpage to activate the recent changes and updates.
2. Click on the "Join Now" button to initiate the sign-up process. Supply a valid email address as instructed.
3. Upon successful completion of the sign-up process, you will be automatically redirected to the confirmation page.
4. On the confirmation page, input the received code from your email client into the designated field.

<img src="assets/Week3/Complete/Signup/userpool again/5 Hm we can custom this from cognito (2).jpg" width="200">

If necessary, you have the option to utilize the "Resend code" feature on the confirmation page, which allows you to obtain a fresh activation code via email.

<img src="assets/Week3/Complete/Signup/userpool again/4 email sent.png">

### Post-Verification Steps

Once the confirmation process has been verified, proceed with the following steps:

1. Upon successful verification of the activation code, navigate to the application's sign-in page.
2. Using your password after confirmation, sign in.

<img src="assets/Week3/Complete/Signup/userpool again/7 sign in after confirmation.png">

## Step 8: Creating Recovery Page

1. Add the auth import to your recovery page.
2. Create two functions: `onsubmit_send_code` and const `onsubmit_confirm_code`.
```js
const onsubmit_send_code = async (event) => {
  event.preventDefault();
  setErrors(''); // Clear any previous error messages.
   # To Be Continued
  return false; // Prevent the default form submission behavior.
}
const onsubmit_confirm_code = async (event) => {
  event.preventDefault();
  setErrors(''); // Clear any previous error messages.
  if (password == passwordAgain) {
   # To Be Continued
  } else {
  }
  return false; 
}
```
3. Define `onsubmit_send_code` to handle submitting the form to send a password reset code.
```js
const onsubmit_send_code = async (event) => {
  event.preventDefault();
  setErrors(''); // Clear any previous error messages.

  // Call the `forgotPassword` method from the `Auth` module to send a password reset code.
  Auth.forgotPassword(username)
    .then((data) => setFormState('confirm_code')) // Move to the next form state after successful request.
    .catch((err) => setErrors(err.message)); // Handle any errors by displaying an error message.
  return false; // Prevent the default form submission behavior.
}
```
4. Define `onsubmit_confirm_code` to handle submitting the confirmation code and new password.
```js
const onsubmit_confirm_code = async (event) => {
  event.preventDefault();
  setErrors(''); 

  // Check if the entered passwords match.
  if (password == passwordAgain) {
    // Call the `forgotPasswordSubmit` method to confirm the password reset using the code and new password.
    Auth.forgotPasswordSubmit(username, code, password)
       // Move to the success state after successful password reset.
      .then((data) => setFormState('success')) 
      // Handle any errors by displaying an error message.
      .catch((err) => setErrors(err.message)); 
  } else {
    // Display an error message if passwords do not match.
    setErrors('Passwords do not match');
  }
  return false; // Prevent the default form submission behavior.
}
```
5. Combine the code to reach this level of dev in your `RecoverPage.js`.
```js
import { Auth } from 'aws-amplify';

const onsubmit_send_code = async (event) => {
  event.preventDefault();
  setErrors('');
  Auth.forgotPassword(username)
    .then((data) => setFormState('confirm_code'))
    .catch((err) => setErrors(err.message));
  return false;
}

const onsubmit_confirm_code = async (event) => {
  event.preventDefault();
  setErrors('');
  if (password == passwordAgain) {
    Auth.forgotPasswordSubmit(username, code, password)
      .then((data) => setFormState('success'))
      .catch((err) => setErrors(err.message));
  } else {
    setErrors('Passwords do not match');
  }
  return false;
}
```

## Step 9: Testing Recovery Page

1. Save the changes to the file and refresh the webpage in your browser.
2. Locate and click on the `Forgot Password` link.
3. Input your email address, then click the `Send Recovery Code` button.
4. Check your email inbox for a message containing a recovery code.

<img src="assets/Week3/Complete/Signup/userpool again/8r.jpg" width="150">

5. On the webpage, enter the recovery code along with your new password.


<img src="assets/Week3/Complete/Signup/userpool again/8 recover pw.png">


6. Click the `Reset` button to finalize the password recovery process.
7. Sign In again using the recovered password.

<img src="assets/Week3/Complete/Signup/userpool again/10.png">

**Reference**
- [Amazon Cognito OpenID Connect](https://docs.aws.amazon.com/cognito/latest/developerguide/open-id.html) 
- [OpenID Connect website](https://openid.net/) 
- [OAuth 2.0 website](https://oauth.net/)