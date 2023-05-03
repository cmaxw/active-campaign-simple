require 'active-campaign-simple/config'

module ActiveCampaign
  class Contact
    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    def id
      @attributes['id']
    end

    def add_tag(tag)
      tag_to_add = Tag.find(tag)
      ActiveCampaign.post('/contactTags', { contactTag: { contact: id, tag: tag_to_add.id } })
    end

    def self.create_or_find_by_email(email)
      search(email).first || new(create({ email: email }))
    end

    def self.create(payload)
      new(ActiveCampaign.post('/contacts', payload: { contact: payload }))
    end

    def self.search(term)
      ActiveCampaign.get('/contacts', query: { search: term })['contacts'].map do |attributes|
        new(attributes)
      end
    end
  end
end
