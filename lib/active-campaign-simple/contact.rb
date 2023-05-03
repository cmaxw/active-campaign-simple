require 'active-campaign-simple/config'

module ActiveCampaign
  class Contact
    def self.create(payload)
      ActiveCampaign::Client.post('/contacts', payload: payload)
    end
  end
end
