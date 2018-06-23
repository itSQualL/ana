**Create**
----
It creates a new relationship, use it to implements follows and
unfollows

* **URL**
  /api/v1/relationships

* **Method:**
  `POST`
  
*  **URL Params**

   **Required:**
 
   `followed_id=[integer]`

* **Success Response:**
  

  * **Code:** 200 <br />
    **Content:** `{ id : 12 }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Must to be logged in" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTRY <br />
    **Content:** `{ followed_id: "can't be nil" }`

* **Sample Call:**

  <_Just a sample call to your endpoint in a runnable format ($.ajax call or a curl request) - this makes life easier and more predictable._> 
