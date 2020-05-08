require_relative 'lib/ProjectRubyTools/version'

Gem::Specification.new do |spec|
  spec.name          = "ProjectRubyTools"
  spec.version       = ProjectRubyTools::VERSION
  spec.authors       = ["Franklyn Rodriguez"]
  spec.email         = ["franklynr92@gmail.com"]

  spec.summary       = %q{SCRAPING RUBY}
  spec.description   = %q{Take information from Ruby-tools in a quicker to reach layout}
  spec.homepage      = "https://github.com/franklynr92"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/franklynr92/ProjectRubyTools"
  spec.metadata["changelog_uri"] = "https://github.com/franklynr92/ProjectRubyTools/CHANGELOG.MD"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 1.10", ">= 1.10.9"
  spec.add_development_dependency "pry", "~> 0.13.1"
  
end
