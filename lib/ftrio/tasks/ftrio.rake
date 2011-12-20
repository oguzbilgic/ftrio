module Ftrio
  namespace :ftrio do
    namespace :branch do
      desc "Creates feature branch"
      task :create, :feature do |cmd, args|
        sh "git checkout master"
        sh "git checkout -b #{args[:feature]}"
      end

      desc "Destroys feature branch"
      task :destroy do
        sh "git checkout master"
        sh "git branch -D #{current_branch}"
      end
    end

    namespace :app do
      desc "Creates feature app"
      task :create do
        feature_app = feature_app(current_branch)
        sh "heroku create #{feature_app} --stack cedar"
        sh "git remote rename heroku #{feature_app}"
      end

      desc "Pushes feature branch into feature app"
      task :push do
        feature_branch = current_branch 
        feature_app = feature_app(current_branch)
        sh "git push #{feature_app} #{feature_branch}:master"
      end

      desc "Destroys feature app"
      task :destroy do
        feature_app = feature_app(current_branch)
        sh "heroku apps:destroy --app #{feature_app} --confirm #{feature_app}"
        sh "git remote rm #{feature_app} "
      end
    end

    namespace :db do
      desc "Pushes development db into feature app"
      task :push do
        feature_app = feature_app(current_branch)
        sh "heroku db:push --app #{feature_app} --confirm #{feature_app}"
      end
    end

    task :create, [:feature] => ["branch:create", "app:create", "app:push", "db:push"]
    task :push => ["app:push"]
    task :destroy => ["app:destroy", "branch:destroy"]
  end
end
