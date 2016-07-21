json.array!(@comments) do |comment|
  json.extract! comment, :id, :message, :article_id
  json.url comment_url(comment, format: :json)
end
