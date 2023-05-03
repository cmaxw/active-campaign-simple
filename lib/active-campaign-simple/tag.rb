require 'active-campaign-simple/config'

module ActiveCampaign
  class Tag
    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    def self.refresh_tag_list
      @@tag_list = ActiveCampaign.get('/tags')['tags'].each_with_object({}) do |tag, list|
        list[tag['tag']] = new(tag)
      end
    end

    def self.find(_tag)
      refresh_tag_list if @@tag_list.nil?
      @@tag_list[_tag]
    end
  end
end
