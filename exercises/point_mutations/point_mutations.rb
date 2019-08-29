class DNA
  def initialize(sequence)
    @orig = sequence
  end

  def hamming_distance(sequence)
    # new_seq = sequence
    # full_length = [@orig.size, new_seq.size].min
    
    # count = 0

    # 0.upto(full_length - 1) do |i|
    #   count += 1 if @orig[i] != new_seq[i]
    # end
    # count

    strand_1 = @orig[0, sequence.length]

    strand_1.chars.zip(sequence.chars).count { |pair| p pair }
  end
end

DNA.new('ACCAGGG').hamming_distance('ACTATGG')