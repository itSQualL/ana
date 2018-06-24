**Update**
----
It updates a relationship, use it to allow a relationship

* **URL**
  /api/v1/relationships/:id

* **Method:**
  `PUT`

*  **URL Params**

   **Required:**
 
   `id=[integer]` (id of the follower)
   `allowed=[boolean]`

* **Success Response:**
  

  * **Code:** 200 <br />
    **Content:** `{"id":1,"follower_id":1,"followed_id":2,"allowed":true,"created_at":"2018-06-23T18:44:46.365Z","updated_at":"2018-06-23T18:44:46.365Z"}`


* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"errors":["You need to sign in or sign up before continuing."]}`

* **Sample Call:**

```
curl -H "access-token: H5EAce0B5BUOQM3Y0t-GYA" -H "client: Y9eiuUCOuI1cCEi54O435A" -H "uid: pepibt2o@pe2p2ito.es" -d 'id=3' -d 'allowed=true' -X PUT http://localhost:3000/api/v1/relationships
```
