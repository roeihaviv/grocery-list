desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
    user = User.find_or_create_by(email: "roeihaviv@gmail.com") do |user|
    user.password = "roeihaviv"
end
