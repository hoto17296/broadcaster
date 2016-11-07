require 'net/smtp'
require 'mail-iso-2022-jp'

class SMTPMail
  attr_accessor :from, :to, :subject, :body, :charset

  def initialize(opts = {})
    @client = Net::SMTP.start(
      opts[:domain],
      opts[:port] || Net::SMTP.default_port,
      opts[:helo_domain] || 'localhost',
      opts[:account],
      opts[:password],
      opts[:authtype] || Net::SMTP::DEFAULT_AUTH_TYPE
    )
    @charset = 'ISO-2022-JP'
  end

  def send
    mail = Mail.new charset: @charset
    mail.subject = @subject
    mail.body = @body

    to = @to.instance_of?(Array) ? @to : @to.split(',')

    body = <<EOT
From: #{@from}
To: #{to.join(",\n ")}
Subject: #{mail.subject}
Date: #{Time::now.strftime("%a, %d %b %Y %X %z")}
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

#{mail.body.encoded}
EOT

    @client.send_message body, @from, *to
  end
end
