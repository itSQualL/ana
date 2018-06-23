**Create**
----
It creates a new user

* **URL**
  /auth

* **Method:**
  `POST`

*  **URL Params**

   **Required:**

   `name=[string]`
   `nickname=[string]`
   `email=[string]`
   `password=[string]`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"status":"success","data":{"uid":"ppp@ppp.es","id":1,"email":"ppp@ppp.es","provider":"email","name":"ana","nickname":"ana","allow_password_change":false,"admin":false,"created_at":"2018-06-23T17:48:34.177Z","updated_at":"2018-06-23T17:48:34.415Z"}}`

* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTRY <br />
    **Content:** `{"status":"error","data":{"id":null,"provider":"email","uid":"","allow_password_change":false,"name":"ana","nickname":"ana","email":"ppp@ppp.es","admin":false,"created_at":null,"updated_at":null},"errors":{"email":["has already been taken"],"nickname":["has already been taken"],"full_messages":["Email has already been taken","Nickname has already been taken"]}}`

* **Sample Call:**
```
  curl -d '{"name":"ana", "nickname":"ana", "email":"ppp@ppp.es", "password":"asdfasdf"}' -H "Content-Type: application/json" -X POST http://localhost:3000/auth
```
