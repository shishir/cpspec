Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/test*.rb']
  t.verbose = true
end
