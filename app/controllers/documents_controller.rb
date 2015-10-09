class DocumentsController < ApplicationController
  before_action :find_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.all
  end

  def show
    @documents = Document.where
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def document_params
  end

  def find_document
  end

end
