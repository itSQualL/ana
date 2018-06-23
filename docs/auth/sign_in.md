**Sign_in**
----
It logs in an existent user **returns the tokens in the header
response**

* **URL**
  /auth/sign_in

* **Method:**
  `POST`

*  **URL Params**

   **Required:**

   `email=[string]`
   `password=[string]`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"data":{"id":1,"email":"ppp@ppp.es","provider":"email","name":"ana","nickname":"ana","uid":"ppp@ppp.es","allow_password_change":false,"admin":false}}`

* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"success":false,"errors":["Invalid login credentials. Please try again."]}`

* **Sample Call:**
  ```
  curl -d '{"email":"pasepibt2o@pe2p2ito.es", "password":"asdfasdf"}' -H "Content-Type: application/json" -X POST http://localhost:3000/auth/sign_in
  ```
