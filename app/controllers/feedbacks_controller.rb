class FeedbacksController < ApplicationController

  def index
    @feedbacks = Feedback.all
    @positive = Feedback.where(content: "Justo era lo que buscaba")
    @negative = Feedback.where(content: "No era lo que buscaba")
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.content = params[:feedback][:content]
    @feedback.query = params[:feedback][:query]
    @sentence = Sentence.find(params[:feedback][:sentence_id])
    @feedback.sentence = @sentence
    if @feedback.save
      flash[:notice] = '¡Gracias por colaborar! Tu opinión hace que tus próximas búsquedas sean más rápidas y eficientes'
      redirect_to sentence_path(@sentence)
    else
      flash[:notice] = 'Tu comentario no se ha podido guardar en este momento. Por favor, trata denuevo en unos minutos. Gracias por tu comprehensión'
      redirect_to sentence_path(@sentence)
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:content, :query)
    # params[:team_member].permit(:users).require(:first_name, :email)
  end
end
