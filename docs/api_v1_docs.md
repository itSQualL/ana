## Api V1 Docs:

### REGISTER

- `POST` - `/auth` - Register a new user [(docs)](./auth/create.md)

### LOG IN
- `POST` - `/auth/sign_in` - Log In an user [(docs)](./auth/sign_in.md)

### RELATIONSHIPS
- `POST` - `/api/v1/relationships` - Follow an user
  [(docs)](./api/v1/relationships/create.md)

- `DELETE` - `/api/v1/relationships/:id` - Unfollow an user
  [(docs)](./api/v1/relationships/destroy.md)

### BLOCKS
- `POST` - `/api/v1/blocks` - Block an user
  [(docs)](./api/v1/blocks/create.md)

- `DELETE` - `/api/v1/blocks/:id` - Unblock an user
  [(docs)](./api/v1/blocks/destroy.md)
