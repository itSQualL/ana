**Create**
----
It creates a new collection note for the current user

* **URL**
  /api/v1/collection_notes

* **Method:**
  `POST`

*  **URL Params**

   **Required:**

   `collection_note[shared]=[boolean]`
   `collection_note[notes][0][body]=[text]`
   `collection_note[notes][0][images][0]=[binary]`

* **Success Response:**

  * **Code:** 200 <br />


* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"errors":["You need to sign in or sign up before continuing."]}`


  OR

  * **Code:** 422 UNPROCESSABLE ENTRY <br />
    **Content:** `{"body":["must exist"]}`
