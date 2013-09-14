class Ngram
  attr_accessor :options

  def initialize(target, options = { regex: / / })
    @target = target
    @options = options
  end

  def ngrams(n)
    @target.split(@options[:regex]).each_cons(n).to_a
  end

  def unigrams
    ngrams(1)
  end

  def bigrams
    ngrams(2)
  end

  def trigrams
    ngrams(3)
  end
end