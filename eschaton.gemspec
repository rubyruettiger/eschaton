Gem::Specification.new do |s|
  s.name         = "eschaton"
  s.version      = "0.0.2"
  s.licenses     = ['MIT']
  s.author       = "Sean Parr"
  s.email        = "seancparr@gmail.com"
  s.summary      = "Play text game Eschaton"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.homepage     = "https://github.com/rubyruettiger"
  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE.md README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'eschaton' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 0'
end