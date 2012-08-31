require "hashifier/version"

module Hashifier
  # A utility class for converting I18n keyed strings to appropriate hashes

  # {"de.active_admin.any" => "Some value", "en.active_record.whatever" => 20}
  # =>
  # {"de" => {"active_admin" => {"any" => "Some value"}}}
  class StringKeyHashExporter
    def export(hash,keys_as_symbols=false,separator=".")
      results = {}
      keys = hash.keys
      keys.each do |key|
#        binding.pry
        components = key.split(separator)
        accessor = nil
        components.each_with_index do |component,idx|
          component_representation = keys_as_symbols ? component.to_sym : component
          is_last = idx == components.size - 1
          if is_last
            accessor[component_representation] = hash[key]
          else
            if accessor
              accessor[component_representation] ||= {}
              accessor = accessor[component_representation]
            else
              results = {component_representation => {}}.merge(results ||= {})
              accessor = results[component_representation]
            end
          end
        end
      end

      results
    end
  end
end
