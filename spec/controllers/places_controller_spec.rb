require 'rails_helper'

RSpec.describe PlacesController, :type => :controller do
  def valid_attributes
    place = FactoryGirl.build(:place)
    {name: place.name}
  end
  describe "GET 'index'" do
    before(:each) do
      get :index
    end
    it "returns http success" do
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    render_views
    
    before(:each) do
      @place = FactoryGirl.create(:place)
      get :show, {:id => @place.id}
    end

    it "returns http success" do
      expect(response).to be_success
    end

    it "contains place name" do
      expect(response.body).to include(@place.name)
    end
  end

  describe "GET 'new'" do
    before(:each) do
      get :new
    end
    it "returns http success" do
      expect(response).to be_success
    end
    it "assign a new place" do
      expect(assigns(:place)).to be_a_new(Place)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Place" do
        expect {
          post :create, :place => valid_attributes
        }.to change(Place, :count).by(1)
      end
      it "redirects to place page" do
       post :create, :place => valid_attributes
       expect(response).to redirect_to(place_path(Place.last))
      end
    end
  end

  describe "GET 'edit'" do
    
    before(:each) do
      @place = FactoryGirl.create(:place)
      get :edit, {:id => @place.id}
    end

    it "returns http success" do
      expect(response).to be_success
    end
  end

  describe "PUT update" do
   
    before(:each) do
      @place = FactoryGirl.create(:place)
    end

    describe "with valid params" do
      before(:each) do
        put :update, :id => @place.id,:place => {:name => 'Nuevo Alohamiento'}
      end
      it "changes place attributes" do
        @place.reload
        expect(@place.name).to eq("Nuevo Alohamiento")
      end

      it "redirects to updated place page" do
        expect(response).to redirect_to(@place)
      end
    end
  end
end
