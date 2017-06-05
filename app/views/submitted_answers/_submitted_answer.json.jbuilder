json.extract! submitted_answer, :id, :user_id, :question_id, :answer, :score, :created_at, :updated_at
json.url submitted_answer_url(submitted_answer, format: :json)
