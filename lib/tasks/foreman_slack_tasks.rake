# Tasks
namespace :foreman_slack do
  namespace :example do
    desc 'Example Task'
    task task: :environment do
      # Task goes here
    end
  end
end

# Tests
namespace :test do
  desc 'Test ForemanSlack'
  Rake::TestTask.new(:foreman_slack) do |t|
    test_dir = File.join(File.dirname(__FILE__), '../..', 'test')
    t.libs << ['test', test_dir]
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
  end
end

namespace :foreman_slack do
  task :rubocop do
    begin
      require 'rubocop/rake_task'
      RuboCop::RakeTask.new(:rubocop_foreman_slack) do |task|
        task.patterns = ["#{ForemanSlack::Engine.root}/app/**/*.rb",
                         "#{ForemanSlack::Engine.root}/lib/**/*.rb",
                         "#{ForemanSlack::Engine.root}/test/**/*.rb"]
      end
    rescue
      puts 'Rubocop not loaded.'
    end

    Rake::Task['rubocop_foreman_slack'].invoke
  end
end

Rake::Task[:test].enhance do
  Rake::Task['test:foreman_slack'].invoke
end

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task['jenkins:unit'].enhance do
    Rake::Task['test:foreman_slack'].invoke
    Rake::Task['foreman_slack:rubocop'].invoke
  end
end
