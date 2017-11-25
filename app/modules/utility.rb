require 'open-uri'
require 'nokogiri'
# require './config/initializers/slack_api.rb'

module Utility
  class Scrap
    def self.get_html(uri)
      charset = nil
      html = open(uri) do |f|
        charset = f.charset
        f.read
      end
      doc = Nokogiri::HTML.parse(html, charset)
    end
  end

  class ErrorHandling
    def self.output_task_log(e,*error_msg)
      logger = Logger.new('log/tasks/error.log', 3, 1024 * 1024)
      logger.formatter = proc do |severity, datetime, progname, msg|
        "[#{datetime}:#{progname}] #{severity}\t-- : #{msg}\n"
      end
      error_msg.each do |em|
        logger.error em
      end
      logger.error e.class
      logger.error e.message
      logger.error e.backtrace.join("\n")
      p "[SystemError!] Check ErrorLog! (log/tasks/error.log)"
    end

    def self.output_message(msg)
      logger = Logger.new('log/tasks/error.log', 3, 1024 * 1024)
      logger.formatter = proc do |severity, datetime, progname, msg|
        "[#{datetime}:#{progname}] #{severity}\t-- : #{msg}\n"
      end
      logger.error msg
      p "[SystemError!] Check ErrorLog! (log/tasks/error.log)"
    end
  end

  class SuccessHandling
    def self.output_task_log(s)
      logger = Logger.new('log/tasks/success.log', 3, 1024 * 1024)
      logger.formatter = proc do |severity, datetime, progname, msg|
        "[#{datetime}:#{progname}] #{severity}\t-- : #{msg}\n"
      end
      logger.info s
      p s
    end
  end

  # class SlackHandling
  #   def self.create_channel(channel_name)
  #     response = Slack.channels_create({name: channel_name})
  #     if response['ok']
  #       p message = "[Success!] Created Slack channel \"\##{channel_name}\""
  #       return message
  #     else
  #       p message = "[Failed!] Check your Slack channel. "
  #       return message
  #     end
  #   end
  #
  #   def self.leave_channel(channel_name)
  #     response = Slack.channels_leave({channel: channel_name})
  #     if response['ok']
  #       p message = "[Success!] Leaved Slack channel \"\##{channel_name}\""
  #       return message
  #     else
  #       p message = "[Failed!] Check your Slack channel. "
  #       return message
  #     end
  #   end
  #
  #   def self.check_channel
  #     response = Slack.channels_list
  #     if response['ok']
  #       response['channels'].each do |channel|
  #         p "The Channel : #{channel['name']} has ChannelID [#{channel['id']}]"
  #       end
  #       return response
  #     else
  #       p message = "[Failed!] Check your Slack channel. "
  #       return message
  #     end
  #   end
  #
  #   def self.post_message(content, user_name, channel_name)
  #     p response = Slack.chat_postMessage(text: content, username: user_name, channel: channel_name)
  #     if response['ok']
  #       p message = "[Success!] Posted message to your channel \"#{channel_name}\""
  #       return message
  #     else
  #       p message = "[Failed!] What happen!. "
  #       return message
  #     end
  #
  #   end
  # end

  class Task
    def self.lock(task_name)
      key = 0
      eval "@lock_#{task_name} = 0"
      loop do
        sleep 0.5
        eval "if @lock_#{task_name} == 1; key = 1; end;"
        break if key == 1
      end
    end

    def self.unlock(task_name)
      eval "@lock_#{task_name} = 1"
    end
  end
end
