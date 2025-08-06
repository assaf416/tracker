require "rake"
require "rubygems"
require "base64"

namespace :app do
  desc "CALLING FAIR API TO DOWNLOAD FILES"
  task :fair_parse_json => :environment do
    res = JSON.load(File.read("tmp/leads.fair.json"))
    for i in res
      name = "#{i["firstName"]} #{i["lastName"]}"
      email = i["email"]
      puts name + " " + email
      puts i.keys
    end
  end
end
