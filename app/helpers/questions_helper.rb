module QuestionsHelper

  def question_header(test, question)
    if question.new_record?
      "Create New #{question.test.title} Question"
    else
      "Edit #{question.test.title} Question"
    end
  end
end
