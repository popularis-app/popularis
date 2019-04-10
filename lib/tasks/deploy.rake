namespace :deploy do
  desc 'Deploy to production'
  task :production do
    remote = "https://git.heroku.com/popularis.git"
    app = "popularis"
    system "heroku maintenance:on --app #{app}"
    system "git push -f #{remote} master"
    system "heroku run rake db:migrate --app #{app}"
    system "heroku run rake db:seed --app #{app}"
    system "heroku maintenance:off --app #{app}"
    system "git checkout master"
  end
end
