namespace :dev do
    desc "這是一個rake" #此處可自行輸入task的描述
	task :the_delete_no_paid => :environment do
	  Booking.where(paid: false).delete_all
	end
end