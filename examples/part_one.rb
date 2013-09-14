require 'ruby_nlp/corpus'
require 'ruby_nlp/ngram'
require 'ruby_nlp/corpus_files/brown'

# This is just so our relative file paths are relative to the right directory
# later on.
Dir.chdir(File.dirname(__FILE__))

puts "Testing our n-grams implementation..."
bigrams = Ngram.new("The quick brown fox jumped over the lazy dog").bigrams
puts bigrams.inspect

puts "And now testing our corpus implementation..."

unless File.directory?('brown')
  puts "You need to extract the brown corpus into the examples directory to run this example."
  exit 1
end

corpus = Corpus.new('brown/c*', BrownCorpusFile)

capitals = ('A'..'Z')
results = Hash.new(0)

corpus.trigrams.each do |trigram|
  if trigram.first == "of" && capitals.include?(trigram[1].chars.first)
    result = [trigram[1]]

    if capitals.include?(trigram[2].chars.first)
      result << trigram[2]
    end

    results[result.join(' ')] += 1
  end
end

puts results.sort_by { |k, v| v }.inspect