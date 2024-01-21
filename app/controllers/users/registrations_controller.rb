class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  private

  def respond_with(resource, _opts = {})
    # モデル.persisted?で保存済みかどうかチェックする(Rails標準メソッド)
    register_success && return if resource.persisted?

    register_failed
  end

  # 登録に成功したことのみを返すメソッド
  def register_success
    render json: {
      message: 'Signed up successfully.',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: { message: 'something went wrong' }, status: :unprocessable_emtity
  end

end
