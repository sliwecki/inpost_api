module InpostApi
  module Helper

    def inpost_lockers_tag(type, options = {})
      select_tag(:inpost_lockers, options_for_select(collection(type)), options)
    end

    private

    def collection(type)
      InpostApi.get_inpost_lockers(type: type).collect do |item|
        [item['address_str'], item['id']]
      end
    end
  end
end

ActiveSupport.on_load(:action_view) { include InpostApi::Helper }
