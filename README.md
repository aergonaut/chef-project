# chef-project

Provides an easy way to configure projects for development.

## Resources/Providers

### project

This will clone the source repo identified in the lwrp into the cookbook's destination directory and also ensure the listed services are enabled.

Enabling nginx will give the project a .dev vhost listening on a socket in the cookbook's socket directory.

#### Example

```ruby
project "coupa_development" do
  source "coupa/coupa_development"
  ruby "1.9.3"
  mysql true
  redis true
  nginx true
end
```

#### Actions

Action  | Description
--------|------------
install | **Default.** Clone the repository and ensure the services are activated.

#### Attributes

Attribute | Description
----------|----
directory | **Name attribute.** The destination directory.
source    | Git repo to clone. Supports `user/repo` shorthand for GitHub.
ruby      | Ruby version to install.
mysql     | Enable MySQL.
postgres  | Enable Postgres.
redis     | Enable Redis.
nginx     | Setup nginx .dev vhost.
