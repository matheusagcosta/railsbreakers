class SyncReadersService
  def initialize(providers)
    @providers = providers
  end

  def sync!
    links_by_provider = {}

    providers.each do |provider|
      links_by_provider[provider] =  provider.links
    end

    all_links = links_by_provider.values.flatten.uniq

    links_by_provider.each do |provider, links|
      links_to_add = all_links - links
      links_to_add.each do |link|
        provider.add_link(link)
      end
    end
  end

  private
    attr_reader :providers

end

