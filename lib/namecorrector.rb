# encoding: utf-8

require 'pp'
require 'yaml'
require 'singleton'

class Surname < String

    attr_accessor :title

    def initialize( surname )
        super
    end

    def to_proper_case()
        SurnameCorrector.instance.correct_surname( self )
    end

end

class SurnameCorrector
    include Singleton

    DataDir = File.join( File.dirname(__FILE__), 'data' )

    attr_accessor :guess_camel_case
    attr_accessor :guess_prepositions
    attr_accessor :guess_titles
    attr_reader   :irregular_surnames
    attr_reader   :prepositions
    attr_reader   :titles
    attr_reader   :split_regexp

    def initialize()
        @guess_camel_case = true
        @guess_prepositions = true
        @guess_titles = true
        File.open( File.join( DataDir, 'titles.yaml' ) ) do |f|
            @titles = YAML.load(f)
        end
        File.open( File.join(DataDir, 'prepositions.yaml') ) do |f|
            @prepositions = YAML.load(f)
        end
        File.open( File.join(DataDir, 'irregular_surnames.yaml') ) do |f|
            @irregular_surnames = YAML.load( f )
        end
        title_pattern = @titles.join('|')
        preposition_pattern = @prepositions.join('|')
        other_pattern= '\w+'
        @split_regexp = Regexp.new(
            '(?:' +
            [title_pattern, preposition_pattern, other_pattern].join('|') +
            ')+', 
            Regexp::IGNORECASE )
    end

    def trivial_proper_case(str)
        # Test wise now the trivial way:
        words = []
        str.split(/[\s]+/).each do |word|
            words << word.capitalize
        end
        words.join(' ')
    end

    def correct_surname(surname)
        corrected_parts = []
        parts = surname.scan( @split_regexp )
        parts.each do |p|
            if ( @prepositions.include?(p) )
                corrected_parts << p
            else 
                corrected_parts << ( irregular_surnames[p] || p.capitalize )
            end
        end
        corrected_parts.join(' ')
    end

end

sn = Surname.new('Hermann ANdreAS von den dipasquale')
puts sn.to_proper_case
