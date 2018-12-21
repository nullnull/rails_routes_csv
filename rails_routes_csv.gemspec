lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_routes_csv/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_routes_csv'
  spec.version       = RailsRoutesCsv::VERSION
  spec.authors       = ['Katsuma Narisawa']
  spec.email         = ['katsuma.narisawa@gmail.com']

  spec.summary       = 'Print out all defined routes in CSV format.'
  spec.description   = 'Print out all defined routes in CSV format.'
  spec.homepage      = 'https://github.com/nullnull/rails_routes_csv'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
