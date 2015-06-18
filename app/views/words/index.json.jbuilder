json.array!(@words) do |word|
  json.extract! word, :id, :polish, :spanish, :description
  json.url word_url(word, format: :json)
end
