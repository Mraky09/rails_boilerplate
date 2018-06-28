class AlivesController < ApplicationController
  def show
    render status: 200, plain: 'IT ALIVE!'
  end
end
