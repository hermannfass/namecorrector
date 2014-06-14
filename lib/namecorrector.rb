# encoding: utf-8

require 'pp'
require 'yaml'
require 'stringextension'

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
        File.open( File.join(DataDir, 'word_separators.yaml') ) do |f|
            @word_separators = YAML.load( f )
        end
        title_pattern = @titles.join('|')
        preposition_pattern = @prepositions.join('|')
        separator_pattern = @word_separators.join('|')
        other_pattern= '(?:[[:word:]]+)'
        @split_regexp = Regexp.new(
            '(?:' +
            [title_pattern, preposition_pattern,
             separator_pattern, other_pattern].join('|') +
            ')', 
            Regexp::IGNORECASE
        )
    end

    # Change the uppercase and lowercase usage in a name according to
    # the typical conventions in German, English, and some other European
    # languages. However, character sets beyond ASCII are not handled
    # properly in the current version. 
    #--
    # To do: Refactor to match the DRY paradigm.
    #++
    def make_proper_case(n)
        corrected_parts = []
        parts = n.scan( @split_regexp )
        done = false
        parts.each do |p|
            done = false
            @prepositions.each do |prep|
                if prep.downcase == p.downcase
                    corrected_parts << prep
                    done = true
                end
            end
            next if done
            @irregular_surnames.each do |isur_k, isur_v|
                if isur_k.downcase == p.downcase
                    corrected_parts << isur_v
                    done = true
                end
            end
            next if done
            if @word_separators.include?(p)
                corrected_parts << p
                done = true
            end
            next if done
            # It was none of the above, so a normal word => just add it.
            corrected_parts << p.unicode_capitalize
        end
        corrected_parts.join('')
    end

end

#nc = NameCorrector.new
#name = 'DR. Med. ährmann-mccormick VOM Faß'
#puts nc.make_proper_case(name)

