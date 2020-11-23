require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  login_user
  context "GET #index" do
    let!(:rooms) { create_list(:room, 5) }
    let(:room_nil) { nil }
    
    it "should success and render to index page" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "should rooms empty" do
      get :index
      expect(assigns(:room_nil)).to be_nil
    end
        
    it "should have list rooms" do
      create(:room)
      get :index
      expect(assigns(:rooms)).not_to eq be_nil
    end
  
  end

  context "GET #show" do
    let(:room) { create(:room) }
    
    it "should success and render to edit page" do
      get :show, params: { id: room.id}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)   
    end

    it "where have id" do
      get :show, params: { id: room.id}
      expect(assigns(:room)).to be_a(Room)
      expect(assigns(:room)).to eq(room)
    end
  end

  context "GET #new" do
    it "should success and render to new page" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)   
    end

    it "should new room" do
      get :new
      expect(assigns(:room)).to be_a(Room)
      expect(assigns(:room)).to be_a_new(Room)
    end
  end

  context "POST #create" do
    let!(:params) {
      { name: "Aut fugiat fugit animi eos.", status: :not_occuped }
    }

    it "create a new room" do
      post :create, params: { room: params } 
      expect(flash[:notice]).to eq("Room create successfull.")  
      expect(response).to redirect_to(action: :show, id: assigns(:room).id)
    end

    it "not create a new room" do
      params = { name: "" }
      post :create, params: { room: params } 
      expect(response).to render_template("new")   
    end
  
  end

  context "GET #edit" do
    let(:room) { create(:room) }
    it "should success and render to edit page" do
      get :edit, params: { id: room.id }
      expect(response).to render_template(:edit)   
      expect(response).to have_http_status(200)
    end

    it "should edit room" do
      get :edit, params: { id: room.id}
      expect(assigns(:room)).to be_a(Room)
    end
  end

  context "PUT #update" do
    let!(:room) { create(:room) }

    it "should update room info" do
      params = { name: "Update name room" }

      put :update, params: {id: room.id, room: params}
      room.reload
      expect(room.name).to eq(params[:name])
      expect(flash[:notice]).to eq("Room update successfull.")
      expect(response).to redirect_to(action: :show, id: assigns(:room).id)
    end
  
    it "should not update post info" do
      params = { name: nil }
      
      put :update, params: {id: room.id, room: params}

      expect(response).to render_template(:edit)
    end
    

  end

  context "DELETE #destroy" do
    let!(:room) { create(:room) }

    it "should delete room" do
      delete :destroy, params: { id: room.id }
      expect(flash[:notice]).to eq("Room destroyed successfull.")
      expect(response).to redirect_to(action: :index)
    end
    
  end
  

end
