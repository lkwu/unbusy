namespace :dev do
    desc "這是一個rake" #此處可自行輸入task的描述
	task :jobs => :environment do
	  User.create!(email: "howclf@gmail.com", password: "123456123")
	end
end