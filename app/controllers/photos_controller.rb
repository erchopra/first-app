class PhotosController < ApplicationController
  
    def create
    @album = current_user.albums.find(params[:album_id])
    respond_to do |format|
      if params[:photo]!=nil
        @album.photos.create(params[:photo])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @album,  notice: 'Please first choose the file' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end
 
  
  def index
    array=Array.new();
    current_user.albums.each do |album|
     album.photos.each do |photo|
       array.push(photo.id)
       end
     end
    if params[:tag]
    @photos = Photo.tagged_with(params[:tag]).where(:id => array)
  else
    @photo=Photo.(array)
  end
  flash[:notice]= "SEARCHING FOR TAG '#{params[:tag]}'"
  respond_to do |format|
   format.html 
   end
end


def show
  @album = current_user.albums.find(params[:album_id])
  @photo=@album.photos.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
end

def update

@album = current_user.albums.find(params[:album_id])
  @photo=@album.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to album_path(@album), notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to album_photo_path(@album , @photo ), notice: 'Tag was not successfully updated.'}
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end



end
  
end
