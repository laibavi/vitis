class Admin::ProductsController < Admin::AdminController
    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
        @product = Product.new product_parmas
        if @product.save
            @pictures = Picture.where(id: params[:picture_id].split(','))
            @pictures.each do |p|
                p.update_attributes(product_id: @product.id)
            end
            flash[:success] = "Create successfully"
            redirect_to admin_products_path
        else
            render :new
        end
    end

    def update
        byebug
      # @product = Product.find_by id: params[:product][:id]
      # respond_to do |format|
      #   if @product.update_attributes product_parmas
      #       flash[:success] = "Sửa thành công"
      #       format.html{}
      #       format.js{}
      #       format.json{ render @product}
      #   else
      #       format.html
      #       format.json{ render json: @product.errors}
      #   end
      # end
    end

    def destroy
      @product = Product.find params[:id]
      @id = params[:id]
      respond_to do |format|
          if @product.destroy
              flash[:success] = "Xoá thành công"
              format.html{ flash[:success] = "Xóa thành công"}
              format.js{}
              format.json {}
          else
              format.html
              format.json { render @product.errors }
          end
      end
    end

    private
    def product_parmas
      params.require(:product).permit :name, :amount, :price, :type_id
    end
end
