class Frontend::Ravers::RegistrationsController < Devise::RegistrationsController
  layout 'frontend'
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
    def index
      if raver_signed_in?
        redirect_to date_path 
      end
      @gif_background = ActionController::Base.helpers.asset_path('beats3.gif')
    end
  # GET /resource/sign_up
    def new
        @raver = Raver.new
        @gif_background = ActionController::Base.helpers.asset_path('beats4.gif')
        session[:email] = params[:email] 
    end

  # POST /resource
    def create
        raver = Raver.new
        raver.email = session[:email]
        if raver.update(sign_up_params)
            sign_in raver
            redirect_to date_path
        else
            raver.errors.each do |error|
                puts error
            end
            flash[:notice] = flash[:notice].to_a.concat raver.errors.full_messages
            redirect_to new_raver_registration_path
        end
    end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  protected

       def sign_up_params
        params.require(:raver).permit(:name,
                                     :surname,
                                     :town,
                                     :email,
                                     :password,
                                     :password_confirmation,
                                     :phone,
                                     :gender)
        end

  # If you have extra params to permit, append them to the sanitizer.
    #def configure_sign_up_params
        #devise_parameter_sanitizer.for(:sign_up) <<  :name  
        #devise_parameter_sanitizer.for(:sign_up) <<  :surname
        #devise_parameter_sanitizer.for(:sign_up) <<  :town
        #devise_parameter_sanitizer.for(:sign_up) <<  :phone
    #end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  #def after_sign_in_path_for(raver)
     #ravers_date_path
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
