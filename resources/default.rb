action :install

attribute :directory, :kind_of => String, :name_attribute => true
attribute :source, :kind_of => String
attribute :ruby, :kind_of => String, :default => "none"
attribute :mysql, :kind_of => [TrueClass, FalseClass], :default => false
attribute :postgres, :kind_of => [TrueClass, FalseClass], :default => false
attribute :nginx, :kind_of => [TrueClass, FalseClass], :default => false

def initialize(name, run_context = nil)
  super
  @action = :install
end
