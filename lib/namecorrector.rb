# encoding: utf-8

require 'pp'
require 'yaml'

class NameCorrector

    DataDir = File.join( File.dirname(__FILE__), 'data' )

    attr_accessor :guess_camel_case
    attr_accessor :guess_prepositions
    attr_accessor :guess_titles
    attr_reader   :irregular_surnames
    attr_reader   :prepositions
    attr_reader   :titles
    attr_reader   :split_regexp

    # Return a new NameCorrector instance.
    #--
    # The Regexp with other_pattern does not catch letters beyond ASCII.
    # Worse, it considers them as word boundaries.
    # Implement something here or in the stringextension package.  
    #++
    def initialize()
        @guess_camel_case = true
        @guess_prepositions = true
        @guess_titles = true
        File.open( File.join( DataDir, 'titles.yaml' ) ) do |f|
            @titles = YAML.load(f)
        end
        File.open( File.join(DataDir, 'prepositions.yaml') ) do |f|
            @prepositions = YAML.load( f )
        end
        File.open( File.join(DataDir, 'irregular_surnames.yaml') ) do |f|
            @irregular_surnames = YAML.load( f )
        end
        title_pattern = @titles.join('|')
        preposition_pattern = @prepositions.join('|')
        other_pattern= '[-\w]+'
        @split_regexp = Regexp.new(
            '(?:' +
            [title_pattern, preposition_pattern, other_pattern].join('|') +
            ')+', 
            Regexp::IGNORECASE )
    end

    # Capitalize every word of a string, treating the part
    # after a hyphen as a new word.
    #--
    # To do: 
    # Change regular expressinos to POSIX or find other way to handle
    # Umlaut, accents, and perhaps other non-ASCII letters correctly.
    # Perhaps the upcase method for String should go to 
    # stringextension.rb or so.
    #++
    def capitalize_name(n)
        corrected_name = ''
        n.scan(/\w+[ -]?/).each { |p| corrected_name << p.capitalize } 
        corrected_name
    end

    # Change the uppercase and lowercase usage in a name according to
    # the typical conventions in German, English, and some other European
    # languages. However, character sets beyond ASCII are not handled
    # properly in the current version. 
    def make_proper_case(n)
        corrected_parts = []
        parts = n.scan( @split_regexp )
        parts.each do |p|
            if ( @prepositions.include?(p) )
                corrected_parts << p
            else 
                corrected_parts << ( irregular_surnames[p] || self.capitalize_name(p) )
            end
        end
        corrected_parts.join(' ')
    end

end

sn = 'Hermann-ANdreAS von den dipasquale-Migräne'
puts NameCorrector.new.make_proper_case(sn)
