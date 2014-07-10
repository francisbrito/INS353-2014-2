json.array!(@grades) do |grade|
  json.extract! grade, :id, :subject_name, :score, :subject_id
  json.url grade_url(grade, format: :json)
end
