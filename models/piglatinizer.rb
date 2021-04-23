require 'pry'
class PigLatinizer
    attr_accessor :text

    VOWELS = "/[aeiou]/"
    CONSONANTS = "/[qwrtypsdfghjklzxcvbnm]/"

    def initialize(text)
        @text = text.downcase.split(" ")
    end

    def vowel?(char)
        VOWELS.include?(char)
    end

    def consonant?(char)
        CONSONANTS.include?(char)
    end

    def convert(word)
        if vowel?(word[0])
            word += "w"
        elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
            word = word[3..] + word[0,3]
        elsif consonant?(word[0]) && consonant?(word[1])
            word = word[2..] + word[0,2]
        elsif consonant?(word[0])
            word = word[1..] + word[0]
        end
        word << "ay"
    end

    def combine(sentence)
        sentence.collect { |word| convert(word) }.join(" ")
    end

    def piglatinize
        @text.size == 1 ? convert(@text.join) : combine(@text)
    end
end