require "ftrio/version"
require "ftrio/railtie" if defined? Rails

module Ftrio
  include Rake::DSL

  def self.app_name
    `echo ${PWD##*/}`.chomp
  end

  def self.current_branch
    `git branch --no-color | grep '*' | cut -d ' ' -f 2`.chomp
  end

  def self.dev_branch(feature_branch)
    "dev-#{feature_branch}"
  end

  def self.dev_app(feature_branch)
    "dev-#{app_name}-#{feature_branch}"
  end

  def self.compile_assets
    sh "rake assets:precompile"
    sh "git add public/assets/*"
    sh 'git commit -m "Precompile assets"'
  end

end
