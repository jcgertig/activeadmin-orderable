# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_admin/sortable_table/version'

Gem::Specification.new do |gem|
  gem.name          = 'activeadmin_sortable_table'
  gem.version       = ActiveAdmin::SortableTable::VERSION
  gem.authors       = ['Adam McCrea', 'Jonathan Gertig', 'Artyom Bolshakov']
  gem.email         = ['adam@adamlogic.com', 'jcgertig@gmail.com', 'abolshakov@spbtv.com']
  gem.description   = 'Drag and drop reordering interface for ActiveAdmin tables'
  gem.summary       = 'Drag and drop reordering interface for ActiveAdmin tables'
  gem.license       = 'MIT'
  gem.homepage      = 'https://github.com/bolshakov/activeadmin_sortable_table'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'activeadmin', '>= 1.0.0.pre1'
  gem.add_dependency 'uber', '0.0.15'
  gem.add_development_dependency 'rails', '~> 4.2'
  gem.add_development_dependency 'capybara'
  gem.add_development_dependency 'rspec-rails', '~> 3.3'
  gem.add_development_dependency 'phantomjs'
  gem.add_development_dependency 'poltergeist'
  gem.add_development_dependency 'database_cleaner'
  gem.add_development_dependency 'launchy'
end
