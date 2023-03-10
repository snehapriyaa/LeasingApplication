# README

### Please ignore the homepage link on the landing page (homepage) Please login first to test functionality.
### Also if theres an error page on the landing page, please open on a different browser.

Admin credentials <br/>
 - email:    admin@email.com <br/>
 - password: pass  <br/>

We use the name "Request" instead of "Application" for the model because of conflict with base files.

Applicant:
  - If not registered, have to sign up using the signup link on the home page.
  - Login through the login page by providing email, password and selecting the "role" (here it is the applicant radio button")
  - Links they have access to:
      - View their application
      - View all properties
      - View property availabilities
      - View current occupied property
  - They can apply for property by clicking the Apply button next to the property on the view all properties page.
  - They can withdraw the application through the View your application page

Agent:
  - If not registered, have to sign up using the signup link on the home page.
  - Login through the login page by providing email, password and selecting the "role" (here it is the agent radio button")
  - Links they have access to:
      - View all applications
      - View all properties
      - Edit profile
      - View property availabilities
      - Add/Edit/Remove property (on the View all properties page)
      - Accept/Reject application (on the View all applications page)
      - Accepting an application automatically rejects other applications and checks-in approved applicant.
  - They can apply for property on behalf of an applicant by clicking the same Apply button next to the property on the view all properties page.
 
Admin:
  - Login through the login page by providing email, password and selecting the "role" (here it is the admin radio button")
  - Links they have access to:
      - View all applications
      - View all properties
      - Edit profile (only name and phone number)
      - View property availabilities
      - Add/View/Edit/Delete property (on the View all properties page)
      - Accept/Reject application (on the View all applications page)
      - Accepting an application automatically rejects other applications and checks-in approved applicant.
      - Add/View/Edit/Delete all applicants (on View all applicants page)
      - Add/View/Edit/Delete all Agents (on View all leasing agents)
  - They can apply for property on behalf of an applicant by clicking the same Apply button next to the property on the view all properties page.
  
  Wailtlist:
  - If a proeprty is already occupied by a tenant, then the user sees "applywaitlist" link against property(on the view all properties page) which enables them to apply for waitlist application.
  - Agent or admin can accept/reject the waitlisted applications(on view all waitlisted applications).
  - Applicant can withdraw from waitlisted application(on view your waitlisted applications).
  - Once a tenant checks out, all the approved waitlisted applications get into application pool ( on view all applications page).
  - Admin/Agent can check-in a waitlist by accepting the application(on view all applications page )  .
  
  
Edge case scenarios that are handled:
  - When a property is deleted the applications associated with that property will be deleted as well.
  - An applicant can view only his own profile and not any other applicant, agent or the admin's.
  - An agent can view only his own data and not of any other agent, applicant or the admin's.
