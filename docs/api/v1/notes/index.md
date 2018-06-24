**Index**
----
Index the different notes, we have 2 types of note index:

- default: list the user notes
- followees_notes: list the shared notes of our followees

* **URL**
  /api/v1/notes

* **Method:**
  `GET`

*  **URL Params**

   **Optional:**

   `type=[nil, "followees_notes"]`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[notes]´

* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"errors":["You need to sign in or sign up before continuing."]}`

* **Sample Call:**

```
curl -H "access-token: H5EAce0B5BUOQM3Y0t-GYA" -H "client: Y9eiuUCOuI1cCEi54O435A" -H "uid: pepibt2o@pe2p2ito.es" -X GET http://localhost:3000/api/v1/notes
```
