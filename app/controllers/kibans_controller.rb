class KibansController < ApplicationController
        before_action :set_kiban, only: [:show, :edit, :update, :destroy]
        require "date"

        # GET /users
        # GET /users.json
        def index
          if @kibans == nil
            @kibans = Kiban.order(経過日: :desc)
          end
            @d1 = Date.today;
              if(params[:time_change]==nil) then
                params[:time_change] = 120;
              end
              if(params[:zero]==nil) then
                params[:zero] = "false";
              end
              if(params[:finish] == nil) then
                params[:finish]="false"
              end
            @kibans.each do |kiban|
              @Maker= MakerDeadline.find_by(メーカー: kiban.メーカー)
              @approaching_deadline = (kiban.最終注文日 + (@Maker.期限*365) - @d1).to_i
              kiban.update(経過日: @approaching_deadline);
              if (@approaching_deadline > params[:time_change].to_i || @Maker.期限 == 0 || kiban.終了 == true) then
                kiban.update(期限間近: false);
              else kiban.update(期限間近: true);
              end
              if((@Maker.期限 == 0 && params[:zero] == "true") || (params[:finish] == "true" && kiban.終了 == true))
                kiban.update(期限間近: true);
              end
            end
            @kibans2 = @kibans.where(期限間近: true).order(経過日: :desc);

            if request.post?
              render :partial => 'table' #テンプレート化しているので表の部分のみ差し替える
            end
        end

        def check
          check = Kiban.find(params[:id]); #チェックボックスを操作したidの基盤のデータ
          check.update(終了: !check.終了) #終了を反転させる
        end

        # GET /users/1
        # GET /users/1.json
        def show
        end

        # GET /users/new
        def new
            @kiban = Kiban.new
        end

        # GET /users/1/edit
        def edit
        end

        # POST /users
        # POST /users.json
        def create
            @kiban = Kiban.new(kiban_params)
            @Maker= MakerDeadline.find_by(メーカー: @kiban.メーカー)
            @approaching_deadline = (@kiban.最終注文日 + (@Maker.期限*365) - Date.today).to_i
            @kiban.経過日 = @approaching_deadline;
            respond_to do |format|
                if @kiban.save
                    format.html { redirect_to @kiban, notice: 'Kiban was successfully created.' }
                    format.json { render :show, status: :created, location: @kiban }
                    else
                    format.html { render :new}
                    format.json { render json: @kiban.errors, status: :unprocessable_entity }
                end
            end
        end

        # PATCH/PUT /users/1
        # PATCH/PUT /users/1.json
        def update
            respond_to do |format|
                if @kiban.update(kiban_params)
                    format.html { redirect_to @kiban, notice: 'Kiban was successfully updated.' }
                    format.json { render :show, status: :ok, location: @kiban }
                    else
                    format.html { render :edit }
                    format.json { render json: @kiban.errors, status: :unprocessable_entity }
                end
            end
        end

        # DELETE /users/1
        # DELETE /users/1.json
        def destroy
            @kiban.destroy
            respond_to do |format|
                format.html { redirect_to kibans_url, notice: 'Kiban was successfully destroyed.' }
                format.json { head :no_content }
            end
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_kiban
            @kiban = Kiban.find_by_id(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def kiban_params
            params.require(:kiban).permit(:基板名 ,:経過日, :最終注文日,:メーカー ,:終了, :備考)
        end

end
