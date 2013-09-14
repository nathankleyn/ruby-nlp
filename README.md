# Ruby NLP

This repository is a pure Ruby toolkit for NLP. It's the examples part of an ongoing series I'm writing on SitePoint.com, so watch this repository for updates!

## Installing

Simply install the gem:

```sh
gem install ruby_nlp
```

## What's In This Project?

### *n*-grams

A simple class to generate *n*-grams from an input string, either per word, per character, or on some custom splitter.

```ruby
require 'ruby_nlp/ngram'
ngram = Ngram.new("foo bar lux win")

ngram.unigrams # => [["foo"], ["bar"], ["lux"], ["win"]]
ngram.bigrams # => [["foo", "bar"], ["bar", "lux"], ["lux", "win"]]
ngram.trigrams # => [["foo", "bar", "lux"], ["bar", "lux", "win"]]
ngram.ngrams(4) # => [["foo", "bar", "lux", "win"]]

ngram = Ngram.new("abcde", regex: //)
ngram.unigrams # => [["a"], ["b"], ["c"], ["d"], ["e"]]
```

### Corpus Extractor

There is a basic corpus loader. It takes a glob for the files that are part of the corpus, and a class to delegate the sentence extraction to.

Currently, support for the following corpus types are included:

* Brown Corpus, in the `BrownCorpusFile` class at `ruby_nlp/corpus_files/brown`. This corpus currently strips the tagging to reveal only the raw sentences in the corpus.

An example of this in action:

```ruby
require 'ruby_nlp/corpus'
require 'ruby_nlp/corpus_files/brown'

corpus = Corpus.new('brown/c*', BrownCorpusFile)
corpus.trigrams # => One *really* big array of trigrams!

corpus.files # => `Array` of `BrownCorpusFile` instances, one for each file found.
corpus.sentences # => Flattened `Array` of sentences.
```

## Examples

Some examples are in the `examples` directory, one per article from SitePoint.com in this series.

## Future Work

* Support for other corpora.
* Preservation, filtering and searching of tags in corpora.
* Markov modelling and chaining.
* Text generation using Markov modelling.
* Part of speech tagging.
* Classification.

## License

The MIT License (MIT)

Copyright (c) 2013 Nathan Kleyn

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.