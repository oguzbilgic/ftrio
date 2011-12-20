module Ftrio

  namespace :ftrio do
    desc "Creates feature_branch and feature_app"
    task :create, :feature do |cmd, args|
      feature_branch = args[:feature]
      feature_app = feature_app(feature_branch)
      sh "git checkout master"
      sh "git checkout -b #{feature_branch}"
      sh "heroku create #{feature_app} --stack cedar"
      sh "git remote rename heroku #{feature_app}"
      sh "git push #{feature_app} #{feature_branch}:master"
      sh "heroku db:push --app #{feature_app} --confirm #{feature_app}"
      sh "git checkout #{feature_branch}"
      puts "\n\n"
      puts "\t#"
      puts "\t# Your feature development app is ready:"
      puts "\t# #{feature_app}.heroku.com"
      puts "\t#"
      puts "\n\n"
    end

    desc "Pushes feature_branch into feature_app"
    task :push do
      feature_branch = current_branch 
      feature_app = feature_app(current_branch)
      sh "git push #{feature_app} #{feature_branch}:master"
      sh "git remote rm #{feature_app} "
    end

    desc "Destroys feature_branch and feature_app"
    task :destroy do
      feature_branch = current_branch 
      feature_app = feature_app(current_branch)
      sh "git checkout master"
      sh "git branch -D #{feature_branch}"
      sh "heroku apps:destroy --app #{feature_app} --confirm #{feature_app}"
    end
  end

end
