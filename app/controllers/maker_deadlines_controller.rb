class MakerDeadlinesController < ApplicationController
        before_action :set_maker, only: [:show, :edit, :update, :destroy]
        
        # GET /users
        # GET /users.json
        def index
            @makers = MakerDeadline.order(id: :desc)
        end
        
        # GET /users/1
        # GET /users/1.json
        def show
        end
        
        # GET /users/new
        def new
            @maker = MakerDeadline.new
        end
        
        # GET /users/1/edit
        def edit
        end
        
        # POST /users
        # POST /users.json
        def create
            @maker = MakerDeadline.new(maker_params)
            
            respond_to do |format|
                if @maker.save
                    format.html { redirect_to @maker, notice: 'Maker was successfully created.' }
                    format.json { render :show, status: :created, location: @maker }
                    else
                    format.html { render :new}
                    format.json { render json: @maker.errors, status: :unprocessable_entity }
                end
            end
        end
        
        # PATCH/PUT /users/1
        # PATCH/PUT /users/1.json
        def update
            respond_to do |format|
                if @maker.update(maker_params)
                    format.html { redirect_to @maker, notice: 'Maker was successfully updated.' }
                    format.json { render :show, status: :ok, location: @maker }
                    else
                    format.html { render :edit }
                    format.json { render json: @maker.errors, status: :unprocessable_entity }
                end
            end
        end
        
        # DELETE /users/1
        # DELETE /users/1.json
        def destroy
            @maker.destroy
            respond_to do |format|
                format.html { redirect_to maker_deadlines_url, notice: 'Maker was successfully destroyed.' }
                format.json { head :no_content }
            end
        end
        
        private
        # Use callbacks to share common setup or constraints between actions.
        def set_maker
            @maker = MakerDeadline.find(params[:id])
        end
        
        # Never trust parameters from the scary internet, only allow the white list through.
        def maker_params
            params.require(:maker_deadline).permit(:メーカー ,:期限, :id)
        end
    end
