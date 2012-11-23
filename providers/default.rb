action :set do

  settings = file settings_path do
    owner "root"
    group "root"
    mode 0644
    content "#{settings_content}\n"
    notifies :restart, resources(:service => "procps")
  end

  new_resource.updated_by_last_action(true) if settings.updated_by_last_action?

end

def settings_filename
  "#{new_resource.priority}-#{normalized_resource_name}.conf"
end

def settings_path
  ::File.join(new_resource.directory, settings_filename)
end

def settings_content
  new_resource.settings.map do |key, value|
    stringify_settings(key, value)
  end.join("\n")
end

def stringify_settings(key, value)
  if value.respond_to?(:each_pair)
    value.map { |nested_key, nested_value| stringify_settings("#{key}.#{nested_key}", nested_value) }
  else
    "#{key} = #{value}"
  end
end

def settings_priority
  new_resource.priority
end

def normalized_resource_name
  new_resource.name.gsub(/[^\w]+/, '_')
end
