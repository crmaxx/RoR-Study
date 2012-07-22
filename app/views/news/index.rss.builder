xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "News portal"
    xml.description "News portal for a new job"
    xml.link news_index_path

    for news in @news
      xml.item do
        xml.title news.title
        xml.description news.full
        xml.pubDate news.created_at.to_s(:rfc822)
        xml.link news_index_path(news)
        xml.guid news_index_path(news)
      end
    end
  end
end