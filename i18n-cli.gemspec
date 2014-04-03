Gem::Specification.new do |s|
  s.name        = 'i18n-cli'
  s.version     = '0.0.2'
  s.date        = '2014-04-03'
  s.summary     = "A client line interface to manage diff and new localization keys in a rails project"
  s.authors     = ["Julien Bachmann"]
  s.email       = 'julien.bachmann@me.com'
  s.homepage    = 'http://rubygems.org/gems/i18n-cli'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'activesupport', '>= 3.2.17'
  s.add_dependency 'slop', '>= 3.4.7'
end