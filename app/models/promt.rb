class Promt < ApplicationRecord
  extend Pagy::Searchkick

  searchkick merge_mappings: true,
             settings: {
               analysis: {
                 analyzer: {
                   searchkick_word_search: {
                     filter: %w[lowercase asciifolding catenate_word_delimiter_graph_filter],
                     type: "custom",
                     tokenizer: "whitespace"
                   },
                   searchkick_word_start_index: {
                     filter: %w[lowercase asciifolding catenate_word_delimiter_graph_filter searchkick_edge_ngram],
                     type: "custom",
                     tokenizer: "whitespace"
                   },
                 },
                 filter: {
                   catenate_word_delimiter_graph_filter: {
                     type: "word_delimiter_graph",
                     catenate_words: true
                   }
                 }
               }
             },
             searchable: [
               :text
             ],
             word_start: [
               :text
             ],
             deep_paging: true

  def search_data
    {
      text: text
    }
  end

  def self.custom_mapping

  end

end
