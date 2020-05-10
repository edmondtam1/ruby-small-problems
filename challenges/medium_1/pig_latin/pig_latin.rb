class PigLatin
  VOWEL_SOUNDS = %w(a e i o u)
  TWO_LETTER_VOWELS = %w(yt xr)
  TWO_LETTER_COMBOS = %w(ch qu th)
  THREE_LETTER_COMBOS = %w(thr sch squ)

  def self.translate_word_old(word)
    word = if word.size >= 3 && THREE_LETTER_COMBOS.include?(word[0..2])
      word[3..-1] + word[0..2]
    elsif word.size >= 2 && TWO_LETTER_COMBOS.include?(word[0..1])
      word[2..-1] + word[0..1]
    elsif word.size >= 2 && TWO_LETTER_VOWELS.include?(word[0..1])
      word
    elsif word.size >= 1 && !VOWEL_SOUNDS.include?(word[0])
      word[1..-1] + word[0]
    else
      word
    end
    word + 'ay'
  end

  def self.translate_word(word)
    if begins_with_vowel_sound?(word)
      word + 'ay'
    else
      consonant_sound, rest_of_word = separate_consonant_sound(word)
      rest_of_word + consonant_sound + 'ay'
    end
  end

  def self.begins_with_vowel_sound?(word)
    word.match(/\A[aeiou]|[xy][^aeious]/)
  end

  def self.separate_consonant_sound(word)
    result = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
    [result[1], result[2]]
  end

  def self.translate(phrase)
    phrase = phrase.split(' ').map { |word| translate_word(word) }
    phrase.join(' ')
  end
  
end
