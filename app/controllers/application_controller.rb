class ApplicationController < ActionController::Base
  private
    def find_test
      @test = Test.find(params[:test_id])
    end
end
