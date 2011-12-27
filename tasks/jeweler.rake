Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "cpspec"
  gem.homepage = "http://github.com/shishir/cpspec"
  gem.license = "MIT"
  gem.summary = %Q{testing framework for chef and puppet}
  gem.description = %Q{lets to run your chef cookbooks or puppet manifest again local vm and runs test on it}
  gem.email = "shishir.das@gmail.com"
  gem.authors = ["Shishir Das"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new
