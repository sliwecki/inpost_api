module InpostApi
  module Cache

    private

    def caching(namespace, key, &block)
      cache_key = "#{namespace}/#{key}"
      if cache_exist?(cache_key)
        read_cache(cache_key)
      else
        write_cache(cache_key, block.call)
      end
    end

    def cache_exist?(key)
      Rails.cache.exist?("#{configuration.endpoint}/#{key}")
    end

    def read_cache(key)
      Rails.cache.read("#{configuration.endpoint}/#{key}")
    end

    def write_cache(key, data)
      Rails.cache.write("#{configuration.endpoint}/#{key}", data, expires_in: 24*60*60)
      data
    end
  end
end
