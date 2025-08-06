require "rake"
require "rubygems"

namespace :app do
  desc "CALLING FAIR API TO DOWNLOAD FILES"
  task :fair => :environment do
    puts "FAIR"

    @fairtoken = ""
    @json = nil

    def fair_access_token
      res = HTTParty.post("https://api.fair.co.il/auth/realms/fair-services/protocol/openid-connect/token",
                          body: { grant_type: "password", client_id: "fair-api", username: "impact_user", password: "IMPC018Oq452" })

      @fairtoken = JSON.parse(res.body)["access_token"]
    end

    def fair_swagger
      res = HTTParty.get("https://api.fair.co.il/api/v1/join/leads?fromDate=2023-05-30",
                         headers: { Authorization: "Bearer #{@fairtoken}" })
      File.write("./leads.json", res.body)
      @json = JSON.parse(res.body)
    end

    def fair_update_status(ext_id)
      res = HTTParty.post("https://api.fair.co.il/api/v1/join/lead/#{ext_id}",
                          body: { "callRiskLevel": 3,
                                  "isAborted": true,
                                  "wasPhoneCall": true }.to_json,
                          headers: { Authorization: "Bearer #{@fairtoken}", "Content-Type" => "application/json", "Accept" => "application/json" })
      puts "----------------------------------"

      @json = JSON.parse(res.body)
    end

    fair_access_token
    res = fair_swagger

    File.write("/home/rails/impact/fair-download.json", @json.to_json)
    puts "=================================="

    for item in @json
      name = item["idNumber"].to_s
      puts item.keys
      next if item["files"].nil?
      puts " --- --- ---"
      for f in item["files"]
        next if f.nil?
        if f["fileType"].include? "Agreement"
          File.write("tmp/#{name.gsub("'", "")}.pdf.txt", f["fileStream"])
        end
        if f["fileType"].include? "BiometricIdA"
          File.write("tmp/#{name.gsub("'", "")}-a.jpeg.txt", f["fileStream"])
        end
        if f["fileType"].include? "BiometricIdB"
          File.write("tmp/#{name.gsub("'", "")}-b.jpeg.txt", f["fileStream"])
        end
      end
    end

    exec("./convert.sh")
  end
end
