class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      message: 'You are logged in',
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  # 登録に成功したことのみを返すメソッド
  def log_out_success
    render json: { message: 'You are logged out' }, status: :ok
  end

  def log_out_failure
    render json { message: 'Hmm mothing happend' }, status: :unauthorized
  end

end
