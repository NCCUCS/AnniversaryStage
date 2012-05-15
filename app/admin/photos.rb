ActiveAdmin.register Photo do
  controller do
    def show
      @photo = Photo.find params[:id]
      redirect_to @photo.image.url
    end
  end
    
end
