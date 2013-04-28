require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

# Default Rake task
task :all => [ :spec, :lint ]

# Disable puppet-lint checks
## Add check name to array to disable
[
  '80chars',
  'class_parameter_defaults',
].each do |check|
  PuppetLint.configuration.send("disable_#{check}")
end

# REF: https://gist.github.com/indirect/2922427
namespace :source do
  def find_and_replace_in_source_files(find, replace)
    puts "Search and replace #{find.inspect} => #{replace.inspect}"
 
    files = %w[ .autotest .rspec .rvmrc Gemfile Procfile config.ru ].select{|f| File.exist?(f) }
    directories = %w[manifests files templates lib spec test] # exclude bin, db, doc, log, and tmp
    directories.each do |d|
      files += Dir[File.join(d, "**/*.{pp,erb,rb}")]
    end
 
    files.each do |file_name|
      text = File.open(file_name, 'r'){ |file| file.read }
      if text.gsub!(find, replace)
        puts "rewriting #{file_name}..."
        File.open(file_name, 'w'){|file| file.write(text)}
      end
    end
  end
 
  desc "Replace all tabs in source code files with two spaces"
  task :detab do
    find_and_replace_in_source_files("\t", "  ")
  end
 
  desc "Remove trailing whitespace on the ends of lines"
  task :detrail do
    find_and_replace_in_source_files(/ +$/, '')
  end
 
  desc "Replace all instances of {pattern} with {result}"
  task :gsub, :pattern, :result do |t, args|
    find_and_replace_in_source_files(Regexp.new(args[:pattern] || ENV['PATTERN']), args[:result] || ENV['RESULT'])
  end
end
