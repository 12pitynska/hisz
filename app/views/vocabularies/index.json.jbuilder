json.array!(@vocabularies) do |vocabulary|
  json.extract! vocabulary, :id, :name
  json.url vocabulary_url(vocabulary, format: :json)
end
