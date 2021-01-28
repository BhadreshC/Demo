class Admins::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  after_action :send_mail, only: [:create]
  append_after_action :set_cookie, only: :create
  # GET /resource/sign_in
  def new
    super
  end

  def send_mail
    puts "-=-=--==--=-=--=0=0=-0=-0=-0-=0-=0"
    puts "-=-=--==--=-=--=0=0=-0=-0=-0-=0-=0"
    puts "-=-=--==--=-=--=0=0=-0=-0=-0-=0-=0"
    puts "new login found on #{request.env['HTTP_USER_AGENT']} and IP is #{request.env['REMOTE_ADDR']}  !"
    puts "#{request.remote_ip}"
    # puts  request.env["devise.skip_timeout"]
    puts "-=-=--==--=-=--=0=0=-0=-0=-0-=0-=0"
    puts "-=-=--==--=-=--=0=0=-0=-0=-0-=0-=0"
    puts "-=-=--==--=-=--=0=0=-0=-0=-0-=0-=0"
  end

  def set_cookie
    puts "-=-=--==--=-=--=0=0=-0=-0=-0-=0-=0"
    puts "-=-=--==--=-=--=0=0=-0=-0=-0-=0-=0"
    puts "cookies is being set"
    puts cookies[:email] = current_admin.email
    puts "-=-=--==--=-=--=0=0=-0=-0=-0-=0-=0"
    puts "-=-=--==--=-=--=0=0=-0=-0=-0-=0-=0"
  end
  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
