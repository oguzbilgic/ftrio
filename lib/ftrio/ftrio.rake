module Ftrio

  namespace :ftrio do
    task :deneme do
      puts app_name
    end

    desc "Creates feature_branch, dev_branch and dev_app"
    task :create, :feature do |cmd, args|
      feature_branch = args[:feature]
      dev_app = dev_app(feature_branch)
      dev_branch = dev_branch(feature_branch)
      sh "git checkout master"
      sh "git checkout -b #{feature_branch}"
      sh "git branch #{dev_branch}"
      sh "git checkout #{dev_branch}"
      compile_assets
      sh "heroku create #{dev_app}"
      sh "git remote rename heroku #{dev_app}"
      sh "git push #{dev_app} #{dev_branch}:master"
      sh "heroku db:push --app #{dev_app} --confirm #{dev_app}"
      sh "git checkout #{feature_branch}"
      puts "\n\n"
      puts "\t#"
      puts "\t# Your feature development app is ready:"
      puts "\t# #{dev_app}.heroku.com"
      puts "\t#"
      puts "\n\n"
    end

    desc "Merges feature_branch into dev_branch and pushes to dev_app"
    task :push do
      feature_branch = current_branch 
      dev_app = dev_app(current_branch)
      dev_branch = dev_branch(current_branch)
      sh "git checkout #{dev_branch}"
      sh "git merge #{feature_branch}"
      compile_assets
      sh "git push #{dev_app} #{dev_branch}:master"
      sh "git checkout #{feature_branch}"
    end

    desc "Destroys feature_branch, dev_branch and dev_app"
    task :destroy do
      feature_branch = current_branch 
      dev_app = dev_app(current_branch)
      dev_branch = dev_branch(current_branch)
      sh "git checkout master"
      sh "git branch -D #{dev_branch}"
      sh "git branch -D #{feature_branch}"
      sh "heroku apps:destroy --app #{dev_app} --confirm #{dev_app}"
    end
  end

end
