**Create**
----
It creates a new block, use it to block users

* **URL**
  /api/v1/blocks

* **Method:**
  `POST`

*  **URL Params**

   **Required:**
 
   `blocked_id=[integer]`

* **Success Response:**
  

  * **Code:** 200 <br />
    **Content:** `{"id":1,"blocker_id":1,"blocked_id":2,"created_at":"2018-06-23T18:44:46.365Z","updated_at":"2018-06-23T18:44:46.365Z"}`


 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"errors":["You need to sign in or sign up before continuing."]}`


  OR

  * **Code:** 422 UNPROCESSABLE ENTRY <br />
    **Content:** `{"blocked":["must exist"]}`

* **Sample Call:**

```
curl -H "access-token: H5EAce0B5BUOQM3Y0t-GYA" -H "client: Y9eiuUCOuI1cCEi54O435A" -H "uid: pepibt2o@pe2p2ito.es" -d 'blocked_id=2' -X POST http://localhost:3000/api/v1/blocks
```
