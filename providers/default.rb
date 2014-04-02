def load_current_resource
  @project = Chef::Resources::Project.new(new_resource.name)
end

action :install do
  repo = if new_resource.source =~ /\A[A-Za-z0-9_-]+\/[A-Za-z0-9_-]+\Z/
    "git@github.com:$1"
  else
    new_resource.source
  end

  git File.join(node["projects"]["src_path"], new_resource.name) do
    repository repo
    action :checkout
    user node["current_user"]
  end

  if !new_resource.ruby.blank?
    rbenv_ruby new_resource.ruby
  end

  if new_resource.mysql
    package "mysql"

    execute "Create #{new_resource.name}_development database" do
      command "mysql -u root --password='' -e 'create database #{new_resource.name}_development if not exists;'"
    end

    execute "Create #{new_resource.name}_test database" do
      command "mysql -u root --password='' -e 'create database #{new_resource.name}_test if not exists;'"
    end
  end

  if new_resource.nginx
    package "nginx"
    package "dnsmasq"
  end
end
