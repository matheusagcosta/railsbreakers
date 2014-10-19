class FakeProvider
  attr_reader :added_links, :links, :added_links

  def initialize(links = [])
    @links = links
    @added_links = []
  end

  def add_link(link)
    @added_links << link
  end
end

