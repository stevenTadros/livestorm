lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "livestorm/version"

Gem::Specification.new do |spec|
  spec.name          = "livestorm"
  spec.version       = Livestorm::VERSION
  spec.authors       = ["steven"]
  spec.email         = ["tadros.steven@gmail.com"]

  spec.summary       = "Livestorm lunch game"
  spec.description   = "test livestorm"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "tty-prompt"
  spec.add_dependency "i18n"
end
