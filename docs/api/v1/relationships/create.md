**Create**
----
It creates a new relationship, use it to implements follows

* **URL**
  /api/v1/relationships

* **Method:**
  `POST`

*  **URL Params**

   **Required:**
 
   `followed_id=[integer]`

* **Success Response:**
  

  * **Code:** 200 <br />
    **Content:** `{"id":1,"follower_id":1,"followed_id":2,"allowed":false,"created_at":"2018-06-23T18:44:46.365Z","updated_at":"2018-06-23T18:44:46.365Z"}`


 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"errors":["You need to sign in or sign up before continuing."]}`


  OR

  * **Code:** 422 UNPROCESSABLE ENTRY <br />
    **Content:** `{"followed":["must exist"]}`

* **Sample Call:**

```
curl -H "access-token: H5EAce0B5BUOQM3Y0t-GYA" -H "client: Y9eiuUCOuI1cCEi54O435A" -H "uid: pepibt2o@pe2p2ito.es" -d 'followed_id=3' -X POST http://localhost:3000/api/v1/relationships
```
