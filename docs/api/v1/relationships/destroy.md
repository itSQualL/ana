**Destroy**
----
It deletes a relationship, use it to implements unfollows

* **URL**
  /api/v1/relationships/:id

* **Method:**
  `DELETE`

*  **URL Params**

   **Required:**

   `id=[integer]` (id of the user to unfollow)

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"id":1,"follower_id":1,"followed_id":2,"allowed":false,"created_at":"2018-06-23T18:44:46.365Z","updated_at":"2018-06-23T18:44:46.365Z"}`

* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"errors":["You need to sign in or sign up before continuing."]}`

  OR

  * **Code:** 404 NOT FOUND <br />

* **Sample Call:**

```
curl -i -H "access-token: NIXx7kc-R-pvQn4tv3TxEA" -H "client: ZwtkI09GBM3xMmW-ztBSIA" -H "uid: pepibt2o@pe2p2ito.es" -X DELETE http://localhost:3000/api/v1/relationships/22
```
