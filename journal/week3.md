# Week 3 — Decentralized Authentication

Traditional authentication systems are centralized and rely on a single point of failure which makes them more vulnerable to cyberattacks. Decentralized authentication is a more secure and private alternative that does not rely on a central authority, welcome to week three.

We'll be onboarding the app to a decentralized authentication system on the aws platform and we'll show you exactly how.

By the end of this, users should have complete ownership of their identities and control how they are shared. You can be confident that your identities are secure and that your data is not being shared without your consent.


# Compressing Authentication Protocols

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

## Yacrud User Authentication

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


## Amplify SDK - The Cognito Client Side
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


### Step 1: Install and Configure Amplify
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

### Step 2: Authentication As Code

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



- Amazon Cognito documentation on OpenID Connect: https://docs.aws.amazon.com/cognito/latest/developerguide/open-id.html
- OpenID Connect website: https://openid.net/
- OAuth 2.0 website: https://oauth.net/