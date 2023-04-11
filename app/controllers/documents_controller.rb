class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, only: [:show, :update, :destroy]

  def index
    if current_user.is_admin?
      @documents = Document.all
    else
      @documents = Document.all.where(user_id: current_user.id)
    end
    render json: {
      documents: @documents
    }
  end

  def show
    render json: @document
  end

  def create
    @document = Document.new(document_params)
    @document.user_id = current_user.id
    binding.pry
    if @document.save
      render json: {
        status: 200,
        message: "#{@document.name} Document saved successfully"
      }, status: :created, location: @document
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  def update
    if @document.update(document_params)
      render json: @document
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @document.destroy
  end

  private
    def document_params
      params.permit(:name, :attachment)
    end

    def set_document
      @document = Document.find(params[:id])
    end
end
