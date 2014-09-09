# User Story – User

### Create Account

#### Story

As a new user
I would like the ability to create a new account
so that I can fully use the site.

#### Acceptance Criteria

  * Can successfully create a new account with the following attributes
    * first_name
    * last_name
    * username
    * email
    * password
    * location
  * Error should be displayed when user attempts to create account with a
    duplicate username or email
  * Account information should be present in database.



### Log in

#### Story

As a user
I would like the ability to log in to my account
so that I can access my account information

#### Acceptance Criteria

  * Correct user is successfully retrieved from database
  * Can successfully access account information



### Edit Account Information

#### Story

As a user
I would like the ability update my account information
so that I can change any inaccurate information.

#### Acceptance Criteria

  * Database is updated with updated user information



### Delete Account

#### Story

As a user
I would like the ability to delete my account
so that my personal information is removed from the database when I want to
stop using site

#### Acceptance Criteria

  * User should be logged out
  * Account information should be removed from database
  * Error should be display when user tries to log in with a deleted account



### Create Session

#### Story

As a user
I would like to create a session in the browser when I log in
so that I don't have to keep inputting my account information.

#### Acceptance Criteria

  * Credentials are saved browser cookie
  * Credential are successfully read by server
  * User can do all task that require being logged in



### Logout

#### Story

As a user,
I would like ability to log out of my account
so that others can't use my account or access my account information.

#### Acceptance Criteria

  * Account is not accessible in browser
  * Server does not have access to destroyed cookie information



### Delete Session Cookie

#### Story

As a user,
I would like my session cookie to be destroyed when I either log out or delete my account
so that the deleted account fully inaccessible.

#### Acceptance Criteria

  * Session cookie should not be present in browser
