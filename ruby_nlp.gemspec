GEM_SPEC = Gem::Specification.new do |spec|
  spec.name = 'ruby_nlp'
  spec.version = '0.0.1'
  spec.extra_rdoc_files = ['README.md']
  spec.summary = 'A simple NLP toolkit in pure Ruby.'
  spec.description = spec.summary + ' See http://github.com/nathankleyn/ruby_nlp for more information.'
  spec.author = 'Nathan Kleyn'
  spec.email = 'nathan@nathankleyn.com'
  spec.homepage = 'http://github.com/nathankleyn/ruby_nlp'
  spec.files = %w(README.md) + Dir.glob('{bin,lib,spec}/**/*')
  spec.require_path = 'lib'
  spec.bindir = 'bin'

  spec.add_development_dependency('rspec', '~>2.14.1')
end
