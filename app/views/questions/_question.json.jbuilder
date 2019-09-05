json.extract! question, :id, :itemno, :quest_txt, :choice1, :choice2, :choice3, :choice4, :answer, :quiz_id, :created_at, :updated_at
json.url question_url(question, format: :json)
