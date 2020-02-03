class Admin::CollectionsController < Admin::AdminController
  def index
      @collections = Collection.all
      @collection = Collection.new
  end

  def show
    @collection = Collection.find params[:id]
    @types = @collection.types
    respond_to do |format|
        if @types
            format.html{}
            format.js{}
            format.json { render json: @collection }
        else
            format.html
            format.json{ render json: @collection.errors}
        end
    end
  end

  def create
      @collection = Collection.new collection_params
      respond_to do |format|
        if @collection.save
            format.html{ redirect_to @collection }
            format.js{}
            format.json{render json: @collection}
        else
            format.html{
                @collections = Collection.all
                render :index
            }
            format.json{ render json: @collection.errors,  status: :unprocessable_entity }
        end
      end

  end

  def update
    @collection = Collection.find_by id: params[:collection][:id]
    respond_to do |format|
      if @collection.update_attributes collection_params
          format.html{}
          format.js{}
          format.json{ render @collection}
      else
          format.html
          format.json{ render json: @collection.errors}
      end
    end
  end

  def destroy
    @collection = Collection.find params[:id]
    @id = params[:id]
    respond_to do |format|
        if @collection.destroy
            format.html{ flash[:success] = "Xóa thành công"}
            format.js{}
            format.json {}
        else
            format.html
            format.json { render @collection.errors }
        end
    end
  end

  private
  def collection_params
      params.require(:collection).permit :name
  end
end
