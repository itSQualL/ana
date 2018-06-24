**Index**
----
Index the different relationships, we have 4 types of relationships:

- followees: users that the current_user has followed
- followers: users that have followed to the current_user
- pending_followees: users that the current_user has followed but not
  accepted yet
- pending_followers: users that have followed to the current_user, but
  not accepted yet

* **URL**
  /api/v1/relationships

* **Method:**
  `GET`

*  **URL Params**

   **Required:**
 
   `type=["followees", "followers", "pending_followees",
"pending_followers"]`

* **Success Response:**
  

  * **Code:** 200 <br />
    **Content:** `[{:id=>171, :provider=>"email", :uid=>"fdksrhzant@example.com", :allow_password_change=>false, :name=>"Test", :nickname=>"tzhafobhaz", :email=>"fdksrhzant@example.com", :admin=>false, :created_at=>"2018-06-24T10:07:51.629Z", :updated_at=>"2018-06-24T10:07:51.629Z"}]`


 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"errors":["You need to sign in or sign up before continuing."]}`

* **Sample Call:**

```
curl -H "access-token: H5EAce0B5BUOQM3Y0t-GYA" -H "client: Y9eiuUCOuI1cCEi54O435A" -H "uid: pepibt2o@pe2p2ito.es" -d 'type="followers"' -X GET http://localhost:3000/api/v1/relationships
```
