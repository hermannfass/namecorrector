require 'pp'
require 'yaml' 
prepositions = []
DATA.select{ |r| r.match(/\w/) }.each do |r|
    prepositions << r.strip 
end
pp prepositions
File.open('prepositions.yaml', 'w') do |f|
    YAML.dump(prepositions, f)
end

__END__
von
von den
zu
van
van den


