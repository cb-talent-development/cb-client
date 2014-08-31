# cb-client

**CB-Client** is a light-weight Ruby wrapper for [CareerBuilder APIs](http://developer.careerbuilder.com/) built according to [PLA](http://en.wikipedia.org/wiki/Principle_of_least_astonishment). Requests are parsed into hashes with native keys.

### Configuration

The library may be configured globally or on a per-instance basis.

```ruby
# Configure global defaults for all client instances
CB.configure do |config|
  config.developer_key = 'WDAAAAAAAAAAAAAAAAAA'
  config.debug = true
end

# Construct a new client with the abovementioned defaults
default_client = CB::Client.new

# Construct a new client with a different developer key
client = CB::Client.new(developer_key: 'WDBBBBBBBBBBBBBBBBBB')
```

**Configuration Options**

- **developer_key** (Required) - CareerBuilder developer key for API access
- **client** - Which [Faraday](https://github.com/lostisland/faraday) adapter to use
- **api_host** - API Base URL
- **debug** - Whether to pass `Test = true` to the API

Additionally, several environmental variables may be used to override all configuration:

`CB_DEBUG`,
`CB_API_HOST`

### Response Object

All requests return a CB::Client::Response instance

- **raw** Original Faraday response object
- **success?** Whether the request was a success or contained errors
- **body** Parsed response body

#### Jobs

```ruby
# V1 jobs search
client.jobs.search(criteria)
```

#### Resumes

```ruby
# V2 resume creation
client.resumes.create(criteria)

# V2 resume parsing
client.resumes.parse(file_path)
```

#### Users

```ruby
# V2 Existence check
client.users.check_existing(email, password)

# V1 Generate temporary password
client.users.temporary_password(external_id)

# V2 Retrieve user information
client.users.retrieve(external_id)

# V2 Change password
client.users.change_password(external_id, old_password, new_password)

# V2 Delete
client.users.delete(external_id)
```

### Future

- Add **transformers** array to config, allowing consumer apps to add mapping to all requests and the development of several mapping libraries
- Additional endpoints
