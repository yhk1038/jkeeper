
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jkeeper/version"

Gem::Specification.new do |spec|
    spec.name          = "jkeeper"
    spec.version       = Jkeeper::VERSION
    spec.authors       = ["Freddy Kim"]
    spec.email         = ["yhkks1038@gmail.com"]

    spec.files       = ["lib/jkeeper.rb", "lib/jkeeper/version.rb", "jkeeper.gemspec"]

    spec.summary       = %q{Easy to link ruby-json with sys-file and api}
    spec.description   = %q{Save hash to local json file, load .json to hash}
    spec.homepage      = "https://rubygems.org"
    spec.license       = "MIT"

    # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
    # to allow pushing to a single host or delete this section to allow pushing to any host.
    if spec.respond_to?(:metadata)
        spec.metadata["allowed_push_host"] = "https://rubygems.org"
    else
        raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
    end

    spec.files         = `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
    end
    spec.bindir        = "exe"
    spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
    spec.require_paths = ["lib"]

    spec.add_development_dependency "bundler", "~> 1.16.a"
    spec.add_development_dependency "rake", "~> 10.0"
    spec.add_development_dependency "rspec", "~> 3.0"
    spec.add_development_dependency "json", '~> 2.0', '>= 2.0.2'
    spec.add_development_dependency "rest-client", '~> 2.0', '>= 2.0.2'
end
