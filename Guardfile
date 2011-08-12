guard 'bundler' do
  watch 'Gemfile'
end

guard 'nanoc' do
  watch %r{^config\.yaml}
  watch %r{^compass-config\.rb}
  watch %r{^Rules}
  watch %r{^lib/.*\.rb}
  watch %r{^layouts/.*}
  watch %r{^content/.*}
end

guard 'livereload' do
  watch %r{output/}
end
