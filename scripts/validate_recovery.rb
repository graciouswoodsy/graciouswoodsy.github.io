#!/usr/bin/env ruby

require "yaml"

path = File.expand_path("../_data/recovery.yml", __dir__)
content = YAML.safe_load_file(path, aliases: false)
errors = []

def walk_pairs(value, path, errors)
  case value
  when Hash
    if value.key?("healing") || value.key?("hate")
      %w[healing hate].each do |mood|
        text = value[mood]
        errors << "#{path}.#{mood} must be a non-empty string" unless text.is_a?(String) && !text.strip.empty?
      end
    end

    value.each do |key, child|
      walk_pairs(child, path.empty? ? key : "#{path}.#{key}", errors)
    end
  when Array
    value.each_with_index do |child, index|
      walk_pairs(child, "#{path}[#{index}]", errors)
    end
  end
end

%w[settings site header navigation home updates story journal help note footer].each do |key|
  errors << "missing top-level key: #{key}" unless content.key?(key)
end

walk_pairs(content, "", errors)

expected_tabs = %w[home updates story journal help note]
actual_tabs = Array(content["navigation"]).map { |item| item["id"] }
errors << "navigation IDs must be exactly: #{expected_tabs.join(', ')}" unless actual_tabs == expected_tabs

formspree_id = content.dig("settings", "formspree_id")
unless formspree_id.is_a?(String) && !formspree_id.strip.empty?
  errors << "settings.formspree_id must be a non-empty string"
end

if errors.empty?
  puts "Recovery content is valid."
  warn "Warning: Formspree is still using YOUR_FORM_ID; note submission will not work yet." if formspree_id == "YOUR_FORM_ID"
else
  warn "Recovery content has #{errors.length} error#{errors.length == 1 ? '' : 's'}:"
  errors.each { |error| warn "- #{error}" }
  exit 1
end
