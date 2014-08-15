$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scheeema/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scheeema"
  s.version     = Scheeema::VERSION
  s.authors     = ["Eadon Jacobs and John Gesimondo"]
  s.email       = ["scheeema@jmondo.com"]
  s.homepage    = "http://github.com/scheeema"
  s.summary     = "Visualize your schema"
  s.description = "Mount the engine, start your rails server, and visit /scheeema to see your table structure. Stop opening schema.rb."

  s.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "d3-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency 'factory_girl_rails'
end
