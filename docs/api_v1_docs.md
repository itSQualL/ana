## Api V1 Docs:

### REGISTER

- `POST` - `/auth` - Register a new user [(docs)](./auth/create.md)

### LOG IN
- `POST` - `/auth/sign_in` - Log In an user [(docs)](./auth/sign_in.md)

### RELATIONSHIPS
- `GET` - `/api/v1/relationships` - List relationships with users
  [(docs)](./api/v1/relationships/index.md)

- `POST` - `/api/v1/relationships` - Follow an user
  [(docs)](./api/v1/relationships/create.md)

- `PUT` - `/api/v1/relationships/:id` - Allow a relationship
  [(docs)](./api/v1/relationships/update.md)

- `DELETE` - `/api/v1/relationships/:id` - Unfollow an user
  [(docs)](./api/v1/relationships/destroy.md)

### BLOCKS
- `POST` - `/api/v1/blocks` - Block an user
  [(docs)](./api/v1/blocks/create.md)

- `DELETE` - `/api/v1/blocks/:id` - Unblock an user
  [(docs)](./api/v1/blocks/destroy.md)

### NOTES
- `GET` - `/api/v1/notes` - List notes
  [(docs)](./api/v1/notes/index.md)

- `POST` - `/api/v1/notes` - Create a note
  [(docs)](./api/v1/notes/create.md)

- `PUT` - `/api/v1/notes/:id` - Update a note
  [(docs)](./api/v1/notes/update.md)

- `DELETE` - `/api/v1/notes/:id` - Removes a note
  [(docs)](./api/v1/notes/destroy.md)


