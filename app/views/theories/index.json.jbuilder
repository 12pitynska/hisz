json.array!(@theories) do |theory|
  json.extract! theory, :id, :title, :body
  json.url theory_url(theory, format: :json)
end
