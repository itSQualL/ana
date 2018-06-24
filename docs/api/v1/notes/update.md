**Update**
----
It updates a note

* **URL**
  /api/v1/notes/:id

* **Method:**
  `PUT`

*  **URL Params**

   **Required:**

   `notes[body]=[text]`
   `notes[shared]=[boolean]`
   `notes[images]=[binaries]`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"id":1,"body":"lorem ipsum,"shared":true,"created_at":"2018-06-23T18:44:46.365Z","updated_at":"2018-06-23T18:44:46.365Z"}`

* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"errors":["You need to sign in or sign up before continuing."]}`

* **Sample Call:**

```
curl -H "access-token: H5EAce0B5BUOQM3Y0t-GYA" -H "client: Y9eiuUCOuI1cCEi54O435A" -H "uid: pepibt2o@pe2p2ito.es" -d 'notes[body]="lorem ipsum'  -d 'notes[shared]=true' -X PUT http://localhost:3000/api/v1/notes/22
```
