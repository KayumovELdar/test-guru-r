class TestsController < ApplicationController
  def index
    @test = Test.all
  end

  def show
    @test = Test.find(params[:id])
end
