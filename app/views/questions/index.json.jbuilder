json.array!(@questions) do |question|
  json.extract! question, :id, :question, :answer
  json.url question_url(question, format: :json)
end
