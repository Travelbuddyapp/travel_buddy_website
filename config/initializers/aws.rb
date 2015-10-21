travelbuddy = "#{Rails.root}/config/application.yml"
if File.exists? travelbuddy
  config = YAML.load_file(travelbuddy)
  config.each{|key,value| ENV[key] || ENV[key] = value.to_s}
end