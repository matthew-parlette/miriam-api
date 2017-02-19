namespace :db do
  namespace :test do
    task :prepare => :environment do
      Rails::Task["db:seed"].invoke
    end
  end
end
