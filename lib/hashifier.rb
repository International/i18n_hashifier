require "hashifier/version"

module Hashifier
  # A utility class for converting I18n keyed strings to appropriate hashes

  # {"de.active_admin.any" => "Some value", "en.active_record.whatever" => 20}
  # =>
  # {"de" => {"active_admin" => {"any" => "Some value"}}}
  class StringKeyHashExporter
    def export(hash,separator=".")
      result = {}
      keys = hash.keys
      keys.each do |key|
        last_value = nil
        subhash = nil
        components = key.split(separator)
        components.each_with_index do |component,idx|
          if last_value
            value = (idx == components.size - 1) ? nil : {}
            last_value[component] ||= value
            if value
              last_value = last_value[component]
            end
          else
            subhash = {component => {}}
            last_value = subhash[component]
          end
        end
        last_value[last_value.keys.first] = hash[key]
        result.merge!(subhash)
      end
      result
    end
  end
end
