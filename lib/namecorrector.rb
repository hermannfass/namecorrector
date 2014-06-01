# encoding: utf-8

require 'pp'
require 'csv'

class NameCorrector

    DataDir = File.join( File.dirname(__FILE__), 'data' )

    attr_accessor :guess_camel_case
    attr_accessor :guess_prepositions
    attr_accessor :guess_titles
    attr_reader   :irregular_surnames
    attr_reader   :prepositions

    def initialize()
        @guess_camel_case = true
        @guess_prepositions = true
        @guess_titles = true
        @irregular_surnames = YAML.load( File.join( DataDir, 'irregular_surnames.yaml')
        @prepositions = YAML.load( File.join( DataDir, 'prepositions.yaml' )
        @titles = YAML.load( File.join( DataDir, 'titles.yaml' )
    end

    def proper_case(str)
        words = []
        str.split(/[\s]+/).each do |word|
            words << word.capitalize
        end
        words.join(' ')
    end

    

end

