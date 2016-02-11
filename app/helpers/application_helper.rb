module ApplicationHelper
  
  def parsed_tweet(tweet)
    # Duplicate the tweet because it's not modifiable
    _parsed_tweet = tweet.text.dup
    
    # Each tweet has several versions of each URL it contains
    tweet.urls.each do |entity|
      html_link = link_to(entity.display_url.to_s, entity.expanded_url.to_s, target: '_blank')
      _parsed_tweet.sub!(entity.url.to_s, html_link)
    end
    
    # Media can also exist in a tweet and its source URLS are treated the same way
    tweet.media.each do |entity|
      html_link = link_to(entity.display_url.to_s, entity.expanded_url.to_s, target: '_blank')
      _parsed_tweet.sub!(entity.url.to_s, html_link)
    end
    
    _parsed_tweet.html_safe
  end

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end
  
end
