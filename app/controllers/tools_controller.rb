class ToolsController < ApplicationController
  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end

  def show
    @tool = Tool.find(params[:id])
  end

end

