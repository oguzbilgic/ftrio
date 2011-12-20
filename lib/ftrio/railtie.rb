module Ftrio
  class Railtie < Rails::Railtie
    rake_tasks do 
      load "ftrio/ftrio.rake"
    end
  end
end
