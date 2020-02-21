require 'twitter'
require 'syslog/logger'
require 'bunny'
require_relative 'twitter_api'
require_relative 'tweet_queue'


class SoaPublisher
  def run
    log = Syslog::Logger.new 'soa_publisher'
    log.info 'Starting up'
    @xface = TwitterApi.new
    @queue = TweetQueue.new
    @queue.establish
    @xface.stream_connect
    @xface.for_each_tweet do |t|
      log.info '.'
      @queue.post(@xface.tweet_to_json(t))
    end
  end
end

SoaPublisher.new.run
