class ReadabilityProvider
  def initialize(token, secret)
    @api = Readit::API.new(token, secret)
  end

  def links
    @api.bookmarks.map do |bookmark|
      bookmark["article"]["url"]
    end
  end
end
