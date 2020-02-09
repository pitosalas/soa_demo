require 'twitter'
require 'bunny'
require 'pry-byebug'
require_relative 'twitter_api'
require_relative 'tweet_queue'

class SoaPublisher
  def run
    puts ENV.inspect
    @xface = TwitterApi.new
    puts @xface.inspect
    @queue = TweetQueue.new
    @queue.establish
    @xface.stream_connect
    @xface.for_each_tweet do |t|
      @queue.post(@xface.tweet_to_json(t))
    end
  end
end

SoaPublisher.new.run
