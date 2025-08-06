namespace :app do
  desc "READ INBOX EMAILS"
  task inbox: :environment do
    require "net/imap"
    require "zip"
    # IMAP

    imap = Mail.defaults do
      retriever_method :imap,
                       :address => "imap.zoho.com",
                       :port => 993,
                       :user_name => "assaf.goldstein@zohomail.com",
                       :password => "demo123demo123!!",
                       :enable_ssl => true
    end

    #
    # loop over emails
    #
    for mail in Mail.all
      email = mail.from[0]
      puts ""
      puts ""
      puts "FROM           ..: #{email}"
      puts "SUBJECT         .: #{mail.subject}"
      puts "UID             .: #{mail.message_id.to_s}"
      puts "ATTACHED FILE   .: #{mail.attachments.first.filename unless mail.attachments.nil?}"

      mail.attachments.each do |attachment|
        puts "ATTACHMENT: #{attachment.content_type} | #{attachment.filename}"
      end
    end
  end
end
