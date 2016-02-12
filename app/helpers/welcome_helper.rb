module WelcomeHelper
  
  def qualify_votes(vote_count)
    case vote_count
        when 0..5  then 'a humble'
        when 6..10 then 'a modest'
        when 11..20 then 'a healthy'
        when 21..50 then 'an impressive'
        when 51..150 then 'an incredible'
        else 'an unbelievable'
    end
  end

end
