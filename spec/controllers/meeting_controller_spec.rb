require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do
  login_user 
    
  context "GET #new" do
    
    let!(:room) {create(:room)}

    it "should success and render to new page" do
      get :new, params: {room_id: room.id}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it "should new meeting" do
      get :new, params: {room_id: room.id}
      expect(assigns(:meeting)).to be_a(Meeting)
      expect(assigns(:meeting)).to be_a_new(Meeting)
    end
  end

  context "POST #create" do

    let!(:user) {create(:user)}
    let!(:room) {create(:room)}
    let!(:params) {
      { user_id: user.id,
        room_id: room.id,
        name: "fugiat tempora esse",
        start_date: Time.parse("#{Date.current} 09:00 UTC"),
        end_date:  Time.parse("#{Date.current} 10:00 UTC")
       }
    }
    it "a new meeting" do
      post :create, params: { room_id: room.id, meeting: params } 
      expect(flash[:notice]).to eq("Meeting create successfull.")  
      expect(response).to redirect_to("/rooms/#{room.id}")
    end

    it "not a new meeting" do
      params = { name: "" }
      post :create, params: { room_id: room.id, meeting: params } 
      expect(response).to render_template(:new, params: {room_id: room.id})   
    end
  
  end  

end
