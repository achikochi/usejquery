xml.instruct! :xml, :version => "1.0"

xml.rss :version => "2.0" do
  xml.channel do
    xml.title       "Use jQuery - Blog Feed"
    xml.description "Latest Blog Posts from Use jQuery."
    xml.link        posts_url(:rss)
    
    @posts.each do |post|
      xml.item do
        xml.title       post.title
        xml.description { xml.cdata! "<p>#{post.excerpt}</p>#{post.content}" }
        xml.pubDate     post.created_at.to_s(:rfc822)
        xml.link        post_slug_url(post, post.slug)
        xml.guid        post.id
      end
    end
  end
end