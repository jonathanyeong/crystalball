# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "crystalball/version"

Gem::Specification.new do |spec|
  spec.name          = "crystalball"
  spec.version       = Crystalball::VERSION
  spec.authors       = ["Pavel Shutsin", "Evgenii Pecherkin", "Jaimerson Araujo"]
  spec.email         = ["publicshady@gmail.com"]

  spec.summary       = "A library for RSpec regression test selection"
  spec.description   = "Provides simple way to integrate regression test selection approach to your RSpec test suite"
  spec.homepage      = "https://github.com/toptal/crystalball"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
          "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = [File.basename("bin/crystalball")]
  spec.require_paths = ["lib"]

  spec.add_dependency "git"

  spec.required_ruby_version = '>= 2.7.8'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
