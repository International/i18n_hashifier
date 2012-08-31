require "hashifier/version"

module Hashifier
  # A utility class for converting I18n keyed strings to appropriate hashes

  # {"de.active_admin.any" => "Some value", "en.active_record.whatever" => 20}
  # =>
  # {"de" => {"active_admin" => {"any" => "Some value"}}}
  class StringKeyHashExporter
    def export(hash,separator=".")
      results = {}
      keys = hash.keys
      keys.each do |key|
#        binding.pry
        components = key.split(separator)
        accessor = nil
        components.each_with_index do |component,idx|
          is_last = idx == components.size - 1
          if is_last
            accessor[component] = hash[key]
          else
            if accessor
              accessor[component] ||= {}
              accessor = accessor[component]
            else
              results = {component => {}}.merge(results ||= {})
              accessor = results[component]
            end
          end
        end
      end

      results
    end
  end
end
