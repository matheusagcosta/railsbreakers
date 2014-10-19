class PocketProvider
  def initialize(access_token)
    @client = Pocket.client(access_token: access_token)
  end

  def links
    links = []
    @client.retrieve(detailType: :complete)["list"].each do |id, item|
      links << item["given_url"]
    end
    links
  end

  def add_link(link)
  end
end
