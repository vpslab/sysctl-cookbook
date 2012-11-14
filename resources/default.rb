def initialize(*args)
  super
  @action = :set
end

actions :set

attribute :name,      :kind_of => String,   :name_attribute => true
attribute :settings,  :kind_of => Hash,     :required => true
attribute :priority,  :kind_of => Integer,  :default => 70
attribute :directory, :kind_of => String,   :default => "/etc/sysctl.d"
