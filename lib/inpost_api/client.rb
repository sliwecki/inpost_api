module InpostApi
  module Client

    def get_inpost_lockers(type: nil)
      caching(:type, type) {
        JSON.parse(RestClient.get(configuration.endpoint, params: { type: type }))['_embedded']['machines']
      }
    rescue RestClient::UnprocessableEntity
      []
    end

    def get_inpost_locker(id)
      caching(:id, id) {
        JSON.parse(RestClient.get(File.join(configuration.endpoint, id)))
      }
    rescue RestClient::ResourceNotFound
      nil
    end
  end
end
