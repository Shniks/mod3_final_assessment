class Word
  attr_reader :word, :root

  def initialize(attrs)
    @word   = attrs[:word]
    @root   = attrs[:root]
  end

  def valid?
    root.present?
  end
end
