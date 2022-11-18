class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    render template: "photos/index"
  end

  def show
    @photo = Photo.find_by(id: params[:id])
    render template: "photos/show"
  end

  def new
    @photo = Photo.new
    render template: "photos/new"
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to "/photos"
    else
      render :new, status: 422
    end
  end

  def edit
    @photo = Photo.find_by(id: params[:id])
    render template: "photos/edit"
  end

  def update
    @photo = Photo.find_by(id: params[:id])

    if @photo.update(photo_params)
      redirect_to "/photos"
    else
      render :edit, status: 422
    end
  end

  def destroy
    @photo = Photo.find_by(id: params[:id])
    @photo.destroy
    redirect_to "/photos", status: :see_other
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :width, :height)
  end
end
