class Admin::TypesController < Admin::AdminController
    def index
        @types = Type.all
        @type = Type.new
    end
    def create
      @type = Type.new type_params
      respond_to do |format|
        if @type.save
            format.html{redirect_to @type}
            format.js{}
            format.json{ render json: @type}
        else
            format.html { redirect_to admin_types_path}
            format.json{ render json: @type.errors }
        end
      end
    end
    def update
        @type = Type.find_by id: params[:type][:id]
        respond_to do |format|
          if @type.update_attributes type_params
              format.html{}
              format.js{}
              format.json{ render @type}
          else
              format.html
              format.json{ render json: @type.errors}
          end
        end
    end

    def destroy
        @type = Type.find params[:id]
        @id = @type.id
        respond_to do |format|
          if @type.destroy
              format.html
              format.js
              format.json
          else
              format.html
              format.json{ render json: @type.errors }
          end
        end
    end

    private
    def type_params
        params.require(:type).permit :name, :collection_id
    end
end
