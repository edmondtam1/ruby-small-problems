class House

  def self.recite
    new.recite
  end

  def recite
    result = ""
    last_verse = ["This is", ".\n\n"]
    pieces.reverse.each do |(obj, act)|
      phrase = act.nil? ? " #{obj}" : " #{obj}\n#{act}"
      result << last_verse.insert(1, phrase).join('')
    end

    result[0..-2]
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
