lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kamikiri/version"

Gem::Specification.new do |spec|
  spec.name          = "kamikiri"
  spec.version       = Kamikiri::VERSION
  spec.authors       = ["Tatsuya Sato"]
  spec.email         = ["satoryu.1981@gmail.com"]

  spec.summary       = %q{A command-line XML/HTML processor.}
  spec.description   = %q{A command-line XML/HTML processor.}
  spec.homepage      = 'https://github.com/satoryu/kamikiri'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/satoryu/kamikiri'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/satoryu/kamikiri/issues'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency "nokogiri", "~> 1.10"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "solargraph", "~> 0.38"
end
