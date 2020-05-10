class InvalidCodonError < StandardError
end

class Translation
  CODON_MAPPING = {
    ['AUG'] => 'Methionine',
    ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA', 'UUG'] =>	'Leucine',
    ['UCU', 'UCC', 'UCA', 'UCG'] =>	'Serine',
    ['UAU', 'UAC'] =>	'Tyrosine',
    ['UGU', 'UGC'] => 'Cysteine',
    ['UGG'] => 'Tryptophan',
    ['UAA', 'UAG', 'UGA'] => 'STOP'
  }

  def self.of_codon(codon)
    CODON_MAPPING.each do |type, acid|
      return acid if type.include?(codon)
    end
    false
  end

  def self.of_rna(rna)
    result = []
    rna.scan(/.{3}/).each do |codon|
      translation = of_codon(codon)
      raise InvalidCodonError if translation == false
      return result if translation == 'STOP'
      result << translation
    end
    result
  end
end

# puts Translation.of_codon('UUU')
# puts Translation.of_rna('AUGUUUUAA')
# puts Translation.of_rna('CARROT')
