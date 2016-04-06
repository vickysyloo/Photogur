class PicturesController < ApplicationController

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_url
    else
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      #redirect_to "/pictures/#{@picture.id}"
      redirect_to picture_path(@picture)
    else
      render :edit
      #needs to have render (page) or else it would attempt to auto-render back to its method page
      #which is :update, and that doesn't exist, so it will return an error
    end
  end

  private # anything after this is not going to be processed on front end, for security reasons
  # if anyone had access to this they could change your database

  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end


end
