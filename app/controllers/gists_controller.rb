class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(question: @test_passage.current_question,
                   user: current_user,
                   url: result.gist_url)
      flash[:notice] = t('.success', url: result.gist_url)
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end
end
