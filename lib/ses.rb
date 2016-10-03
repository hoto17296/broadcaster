require 'aws-sdk'
require 'mail-iso-2022-jp'

class SES
  attr_accessor :from, :to, :subject, :body, :charset

  def initialize(opts)
    opts[:region] = 'us-east-1' if opts[:region].nil?
    @client = Aws::SES::Client.new opts
    @charset = 'ISO-2022-JP'
  end

  def send
    mail = Mail.new charset: @charset
    mail.subject = @subject
    mail.body = @body

    to = @to.instance_of?(Array) ? @to : @to.split(',')

    @client.send_email({
      source: @from,
      destination: {
        to_addresses: to,
      },
      message: {
        subject: {
          data: mail.subject,
          charset: @charset,
        },
        body: {
          text: {
            data: mail.body.encoded,
            charset: @charset,
          },
        },
      },
    })
  end
end
