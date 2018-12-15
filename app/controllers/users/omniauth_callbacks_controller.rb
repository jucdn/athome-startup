class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def slack
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_slack_oauth(request.env["omniauth.auth"])

    unless @user.nil?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Slack") if is_navigational_format?
    else
      flash[:notice] = "Vous n'êtes pas autorisé à entrer"
      redirect_to root_path
    end

  end

  def failure
    redirect_to root_path
  end
end
