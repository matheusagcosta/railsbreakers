class ReadabilityProvider
  def initialize(token, secret)
    @api = Readit::API.new(token, secret)
  end

  def links
    @api.bookmarks.map do |bookmark|
      bookmark["article"]["url"]
    end
  end

  def add_link(url)
    @api.bookmark(url: url)
  end
end
