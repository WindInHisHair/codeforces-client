# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codeforces_client/version'

Gem::Specification.new do |spec|
  spec.name          = "codeforces_client"
  spec.version       = CodeforcesClient::VERSION
  spec.authors       = ["windinhishair"]
  spec.email         = ["xibaiyu@msn.com"]

  spec.summary       = %q{ Tool for codeforces contests: quick create sample test file.}
  spec.description   = %q{ go to the Codeforces Contest directory to run 'codeforces_client CONTEST PROBLEM', such as 'codeforces_client 611 a' to create contest directory .}
  spec.homepage      = "https://github.com/WindInHisHair/codeforces-client"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }  
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "yaml", ">=0"
  spec.add_development_dependency "codeforcesapi", ">=0"

  spec.add_dependency "codeforcesapi", ">=0"
end
