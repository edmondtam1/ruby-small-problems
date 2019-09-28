class Crypto
  def initialize text
    @text = text
  end

  def normalize_plaintext
    @text = @text.scan(/[\da-zA-Z]/).join('').downcase
  end

  def size
    @size = Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    # result = ''

    # 0.upto(size) do |i| 
    #   plaintext_segments.reduce("") { |result, w| result += w[i] unless w[i].nil?}
    # end
    # result
    encode_plaintext
  end

  def normalize_ciphertext
    encode_plaintext(' ')
  end

  def encode_plaintext(delimeter='')
    padded_words = plaintext_segments.map { |word| right_pad(word, size) }
    padded_words.map(&:chars).transpose.map(&:join).map(&:strip).join(delimeter)
  end

  def right_pad(string, size)
    string + ' ' * (size - string.size)
  end

end

crypto = Crypto.new('s#$%^&plunke')
print crypto.ciphertext
