class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call
    gist_url = result.html_url
    gist_id = result.id

    if   gist_url.present?
      Gist.create!(question: @test_passage.current_question,
                   user: current_user,
                   url:   gist_url)

      flash[:notice] = t('.success',url:   gist_url, gist_id: gist_id)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end
end
