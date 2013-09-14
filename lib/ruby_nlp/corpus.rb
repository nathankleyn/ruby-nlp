require 'ruby_nlp/ngram'

class Corpus
  def initialize(glob, klass)
    @glob = glob
    @klass = klass
  end

  def files
    @files ||= Dir[@glob].map do |file|
      @klass.new(file)
    end
  end

  def sentences
    files.map do |file|
      file.sentences
    end.flatten
  end

  def ngrams(n)
    sentences.map do |sentence|
      Ngram.new(sentence).ngrams(n)
    end.flatten(1)
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