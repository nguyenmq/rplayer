# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |spec|
  spec.name          = "rplayer"
  spec.version       = '0.1'
  spec.authors       = ["Minh-Quan Nguyen"]
  spec.email         = ["minhquanng08@gmail.com"]
  spec.summary       = %q{CD player that interfaces with beets and last.fm}
  spec.description   = %q{CD player that is able to derive song metadata from the beets library and scrobble played tracks to last.fm}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = ['lib/rplayer.b']
  spec.executables   = ['bin/rplayer']
  spec.test_files    = ['tests/test_rplayer.rb']
  spec.require_paths = ['lib']
end
