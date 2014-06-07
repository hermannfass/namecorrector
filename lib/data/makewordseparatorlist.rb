require 'pp'
require 'yaml' 
prepositions = []
File.open('word_separators.yaml', 'w') do |f|
    YAML.dump(['\s', '-', '_', '\.'], f)
end
