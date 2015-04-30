class Admin::ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def create
    content = Content.new(new_content_params)
    if content.save
      flash[:notice] = "Content successfully created."
      redirect_to admin_contents_path
    else
      flash[:error] = content.errors.messages.values[0][0]
      render :index
    end
  end

  private

  def new_content_params
    params.require(:content).permit(:title, :body)
  end
end
