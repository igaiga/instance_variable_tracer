lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "instance_variable_tracer/version"

Gem::Specification.new do |spec|
  spec.name          = "instance_variable_tracer"
  spec.version       = InstanceVariableTracer::VERSION
  spec.authors       = ["Kuniaki Igarashi"]
  spec.email         = ["igaiga@gmail.com"]

  spec.summary       = "Tracing instance variable assignment."
  spec.description   = "Tracing instance variable assignment."
  spec.homepage      = "https://github.com/igaiga/instance_variable_tracer"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/igaiga/instance_variable_tracer"
  spec.metadata["changelog_uri"] = "https://github.com/igaiga/instance_variable_tracer/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
