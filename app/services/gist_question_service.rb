class GistQuestionService
  def initialize(question, client:nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: '350f21525998be6e2f9255413b1605892d33fe2c')
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_url
    @client.html_url
  end

  def gist_id
    @client.html_id
  end

  def success?
    @client.html_url.present?
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
    content.join("\n")
  end
end
