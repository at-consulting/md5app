require 'rails'

module Md5app
  class Railtie < Rails::Railtie
    rake_tasks do
      require 'md5app/md5_dir'
      load 'md5app/tasks/run.rake'
    end
  end
end
