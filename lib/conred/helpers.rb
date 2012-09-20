require "conred/version"

module Conred

  module Helpers
    
    extend self

    @action_view = ActionView::Base.new

    def sanitize_and_trim(text, word_count = nil, omission = '...')
      text = @action_view.strip_tags(text)
      if word_count
        @action_view.truncate(text, :length => word_count, :omission => omission)
      else
        text
      end
    end

    def sanitize_body(text)
      text = @action_view.sanitize(text, :tags => %w(p a strong ul ol li blockquote strike u em), :attributes => %w(href))
      text.html_safe
    end

    def external_url(link)
      /^http/.match(link) ? link : "http://#{link}"
    end

  end

end