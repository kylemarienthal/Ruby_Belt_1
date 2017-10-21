class IdeasController < ApplicationController
  def index
    @ideas =  Idea.all
  end
  def create
    @idea = Idea.create(idea_params)
      puts '*****************************************'
    return redirect_to bright_ideas_path if @idea.valid?

    flash[:errrors] = @idea.errors.full_messages

    return redirect_to :back

  end
  
  def show
    @idea = Idea.find(params[:id])
  end

  def destroy
    @idea = Idea.find(params[:id])
    puts '***********************************'
    puts @idea.content
    puts @idea.id
    @idea.destroy
    return redirect_to :back
  end
  private
    def idea_params
      params.require(:idea).permit(:content).merge(user:current_user)
    end
end
