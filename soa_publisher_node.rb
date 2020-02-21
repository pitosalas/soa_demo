require 'twitter'
require 'bunny'
require_relative 'twitter_api'
require_relative 'tweet_queue'

class SoaPublisher
  def run
    puts "*********************"
    @xface = TwitterApi.new
    @queue = TweetQueue.new
    @queue.establish
    puts "about to connect"
    @xface.stream_connect
    puts "connected"
    @xface.for_each_tweet do |t|
      puts "."
      @queue.post(@xface.tweet_to_json(t))
    end
  end
end

SoaPublisher.new.run
