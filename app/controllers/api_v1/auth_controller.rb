class ApiV1::AuthController < ApiController
  before_action :authenticate_user!, :only => [:logout]

  def signup
    @user = User.new
    @users = User.all
    if params[:email] && params[:password]
      @user.email = params[:email]
      @user.password = params[:password]

      if @user.save
        render :json => { :message => "ok" }
      else
        if @users.find_by_email(params[:email])
          render :json => { :message => "email已經註冊過囉" }, :status => 404
        elsif params[:password].length < 8
          render :json => { :message => "密碼長度錯誤" }, :status => 404
        else
          render :json => { :message => "create error" }, :status => 404
        end
      end
    end
  end




  def login
    # user = User.find_by_email( params[:email] )

    # if user && user.valid_password?( params[:password] )
    #   render :json => { :user_id => user.id, 
    #                     :auth_token => user.authentication_token }
    # else
    #   render :json => { :message => "email or password is not correct" }, :status => 401
    # end
    success = false

    if params[:email] && params[:password]
      user = User.find_by_email( params[:email] )
      success = user && user.valid_password?( params[:password] )
    elsif params[:access_token]
      fb_data = User.get_fb_data( params[:access_token] )
      if fb_data
        auth_hash = OmniAuth::AuthHash.new({
          uid: fb_data["id"],
          info: {
            email: fb_data["email"]
          },
          credentials: {
            token: params[:access_token]
          }
        })
        user = User.from_omniauth(auth_hash)
      end
      success = fb_data && user.persisted?
    end
    if success
      render :json => { :auth_token => user.authentication_token,
                        :user_id => user.id }
    else
      render :json => { :message => "email or password is not correct" }, :status => 401
    end
  end


  def logout
    user = current_user
    
    user.generate_authentication_token
    user.save!

    render :json => { :message => "ok" }
  end

end
