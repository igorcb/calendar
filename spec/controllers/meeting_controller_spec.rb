require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do
  
  context "GET #index" do
    let!(:meetings) { create_list(:meeting, 5) }
    let(:meeting_nil) { nil }
    
    it "should success and render to index page" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "should meeting empty" do
      get :index
      expect(assigns(:meeting_nil)).to be_nil
    end
        
    it "should have list meeting" do
      create(:meeting)
      get :index
      expect(assigns(:meeting)).not_to eq be_nil
    end
  
  end

  context "GET #show" do
    let(:meeting) { create(:meeting) }
    
    it "should success and render to edit page" do
      get :show, params: { id: meeting.id}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)   
    end

    it "where have id" do
      get :show, params: { id: meeting.id}
      expect(assigns(:meeting)).to be_a(Meeting)
      expect(assigns(:meeting)).to eq(meeting)
    end
  end

  context "GET #new" do
    it "should success and render to new page" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it "should new meeting" do
      get :new
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
        start_date: Time.parse("#{Date.current} 09:00"),
        end_date:  Time.parse("#{Date.current} 10:00")
       }
    }

    it "create a new meeting" do
      post :create, params: { meeting: params } 
      expect(flash[:notice]).to eq("Meeting create successfull.")  
      expect(response).to redirect_to(action: :show, id: assigns(:meeting).id)
    end

    it "not create a new meeting" do
      params = { name: "" }
      post :create, params: { meeting: params } 
      expect(response).to render_template("new")   
    end
  
  end

  context "GET #edit" do
    let(:meeting) { create(:meeting) }
    it "should success and render to edit page" do
      get :edit, params: { id: meeting.id }
      expect(response).to render_template(:edit)   
      expect(response).to have_http_status(200)
    end

    it "should edit meeting" do
      get :edit, params: { id: meeting.id}
      expect(assigns(:meeting)).to be_a(Meeting)
    end
  end

  context "PUT #update" do
    let!(:meeting) { create(:meeting) }

    it "should update meeting info" do
      params = { name: "Update name meeting" }

      put :update, params: {id: meeting.id, meeting: params}
      meeting.reload
      expect(meeting.name).to eq(params[:name])
      expect(flash[:notice]).to eq("Meeting update successfull.")
      expect(response).to redirect_to(action: :show, id: assigns(:meeting).id)
    end
  
    it "should not update post info" do
      params = { name: nil }
      
      put :update, params: {id: meeting.id, meeting: params}

      expect(response).to render_template(:edit)
    end
    

  end

  context "DELETE #destroy" do
    let!(:meeting) { create(:meeting) }

    it "should delete meeting" do
      delete :destroy, params: { id: meeting.id }
      expect(flash[:notice]).to eq("Meeting destroyed successfull.")
      expect(response).to redirect_to(action: :index)
    end
    
  end
  

end
