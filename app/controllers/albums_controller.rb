class AlbumsController < ApplicationController
  
    def index
     @albums = current_user.albums
    #@albums = Album.where("user_id = ?",current_user.id).all
    #paginate(:page => params[:page], :per_page => 3)
    #Kaminari.paginate_array(@products).page(params[:page]).per(10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

    @album = current_user.albums.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @album = current_user.albums.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /posts/1/edit
  def edit
    @album = current_user.albums.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
#    @album =current_user.albums.create(:title =>params[:album][:title])
#    current_user.photos.create(params[:album][:avatar])
    @album = current_user.albums.create(params[:album])
    respond_to do |format|
      if @album.save
        #then call to show
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @album = current_user.albums.find(params[:id])
    respond_to do |format|
      if @album.update_attributes(:title => params[:album][:title])
        format.html { redirect_to @album, notice: 'Album Name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit"  }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
     end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    #debugger
    @album = current_user.albums.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
end
