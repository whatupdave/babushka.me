dep 'deployed' do
  requires 'built'
end

dep 'built', :template => 'benhoskings:task' do
  run {
    shell "bundle exec nanoc compile", :log => true
  }
end
