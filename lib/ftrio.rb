require "rake"
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

  def self.feature_app(feature_branch)
    "#{app_name}--#{feature_branch}"
  end
end
