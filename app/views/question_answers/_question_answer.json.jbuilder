json.extract! question_answer, :id, :question_id, :answer_id, :created_at, :updated_at
json.url question_answer_url(question_answer, format: :json)
