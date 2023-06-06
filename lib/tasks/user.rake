namespace :user do
  # [...]
  desc "Enrich a given user with Clearbit (sync)"
  task update: :environment do
    user = User.find(ENV["USER_ID"])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user)
    # rake task will return when job is _done_
  end
end
