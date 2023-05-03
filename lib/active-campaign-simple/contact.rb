require 'active-campaign-simple/config'

module ActiveCampaign
  class Contact
    def initialize(attributes)
      @attributes = attributes
    end

    def self.create_or_find_by_email(email)
      new(search(email).first || create({ email: email }))
    end

    def self.create(payload)
      new(ActiveCampaign.post('/contacts', payload: { contact: payload }))
    end

    def self.search(term)
      ActiveCampaign.get('/contacts', query: { search: term })['contacts']
    end
  end
end
