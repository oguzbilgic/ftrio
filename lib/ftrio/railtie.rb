module Ftrio
  class Railtie < Rails::Railtie
    rake_tasks do 
      load "ftrio/tasks/ftrio.rake"
    end
  end
end
