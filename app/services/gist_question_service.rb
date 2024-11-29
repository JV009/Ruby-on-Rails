class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
  end
  
  private

  def gist_params
    {
      description: I18n.t("services.gist_question.description", title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answer.pluck(:body)
    content.join("\n")
  end

  def default_client
    Octokit::Client.new(:access_token ENV['GITHUB_TOKEN'])
  end
end
