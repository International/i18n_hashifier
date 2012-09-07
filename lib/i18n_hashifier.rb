require "i18n_hashifier/version"

module I18nHashifier
  class StringKeyHashExporter
    def export(hash,keys_as_symbols=false,separator=".")
      results = {}
      keys = hash.keys
      keys.each do |key|
#        binding.pry
        puts "Working on key #{key}"
        components = key.split(separator)
        accessor = nil
        components.each_with_index do |component,idx|
          puts "Accessing component class:#{component.class} value:#{component} idx=#{idx}"
          puts "Accessor: #{accessor.inspect}"
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
