class GistQuestionService
  def initialize(question, client:)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_url
    @client.html_url
  end

  def success?
    @client.last_response.html_url.present?
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.desc', test_name: @test.name),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.text]
    content += @question.answers.pluck(:text)
    content.join("/n")
    #[@question.text+@question.answers.pluck(:text)].join(/n)
  end
end
