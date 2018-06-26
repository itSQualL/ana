**Update**
----
It updates a collection note

* **URL**
  /api/v1/collection_notes/:id

* **Method:**
  `PUT`

*  **URL Params**

   **Required:**

   `collection_note[shared]=[boolean]`
   `collection_note[notes][:id][:attribute]=[text]`

* **Success Response:**

  * **Code:** 200 <br />

* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"errors":["You need to sign in or sign up before continuing."]}`
