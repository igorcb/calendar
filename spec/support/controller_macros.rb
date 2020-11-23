module ControllerMacros
  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end
end

# def auth_header(user = nil, merge_with: {})
#   user ||= create(:user)
#   auth = user.create_new_auth_token
#   header = auth.merge({ 'Content-Type' => 'application/json', 'Accept' => 'application/json' })
#   header.merge merge_with
# end