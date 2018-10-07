class StaticPagesController < ApplicationController
  def home
  end
  

  def new
    @book = Book.new
  end
end
