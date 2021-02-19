class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.html_url.present?
      Gist.create!(question: @test_passage.current_question,
                   user: current_user,
                   url: result.html_url)

      flash[:notice] = t('.success',url: result.html_url, gist_id: result.id)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end
end
