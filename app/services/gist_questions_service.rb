class GistQuestionsService

  def initialize(question, client: http_client)
    @question = question
    @test_title = question.test.title
    @client = client
  end

  def call
    @client.create_gist(params).yield_self { |response| retrieve_url response }
  rescue Octokit::Unauthorized => _e
    OpenStruct.new(success?: false)
  end

  private

  def params
    {
      description: t('services.gist.description',title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def retrieve_url(response)
    OpenStruct.new(
      success?: @client.last_response.status == 201,
      url: response[:html_url]
    )
  end

  def gist_content
    ([@question.body] + @question.answers.pluck(:body)).join("\n")
  end

  def http_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end
end
