namespace :petitions do
  desc "Deleting old petitions"
  task check_old: :environment do
  	VotingEndingJob.perform_later
  end

end
