namespace :grape do
  desc 'routes'
  task :routes => :enviroment do
    API.routes.each do |route|
      method = route.options[:method].ljust(10)
      path = route.pattern.origin.gsub(':version', route.options[:version])
      puts "#{method} #{path}"
    end
  end
end