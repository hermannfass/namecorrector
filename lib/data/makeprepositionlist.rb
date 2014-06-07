require 'pp'
require 'yaml' 
prepositions = []
DATA.select{ |r| r.match(/\w/) }.each do |r|
    prepositions << r.strip 
end
File.open('prepositions.yaml', 'w') do |f|
    YAML.dump(prepositions.reverse, f)
end

# Order of prepositions in data section:
# Where values intersect start with the longer one, e.g.
# put "von den" after "von".
__END__
vom
von
von den
zu
van
van den
de
de la
du

