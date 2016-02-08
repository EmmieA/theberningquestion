class TwitterApi
  
  def self.get_bernie_tweets
    client.user_timeline('SenSanders', count: 8, exclude_replies: true, include_rts: false)
  end
  
  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWT_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWT_CONSUMER_SECRET']
      # Only need these to write to Twitter
      # config.access_token        = ENV['TWT_ACCESS_TOKEN']
      # config.access_token_secret = ENV['TWT_ACCESS_SECRET']
    end
  end
  
end
