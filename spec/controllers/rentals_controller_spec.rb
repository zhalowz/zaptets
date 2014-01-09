require 'spec_helper'

describe RentalsController do

  def mock_rental(stubs={})
    @mock_rental ||= mock_model(Rental, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all rentals as @rentals" do
      Rental.stub(:all) { [mock_rental] }
      get :index
      assigns(:rentals).should eq([mock_rental])
    end
  end

  describe "GET show" do
    it "assigns the requested rental as @rental" do
      Rental.stub(:find).with("37") { mock_rental }
      get :show, :id => "37"
      assigns(:rental).should be(mock_rental)
    end
  end

  describe "GET new" do
    it "assigns a new rental as @rental" do
      Rental.stub(:new) { mock_rental }
      get :new
      assigns(:rental).should be(mock_rental)
    end
  end

  describe "GET edit" do
    it "assigns the requested rental as @rental" do
      Rental.stub(:find).with("37") { mock_rental }
      get :edit, :id => "37"
      assigns(:rental).should be(mock_rental)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created rental as @rental" do
        Rental.stub(:new).with({'these' => 'params'}) { mock_rental(:save => true) }
        post :create, :rental => {'these' => 'params'}
        assigns(:rental).should be(mock_rental)
      end

      it "redirects to the created rental" do
        Rental.stub(:new) { mock_rental(:save => true) }
        post :create, :rental => {}
        response.should redirect_to(rental_url(mock_rental))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved rental as @rental" do
        Rental.stub(:new).with({'these' => 'params'}) { mock_rental(:save => false) }
        post :create, :rental => {'these' => 'params'}
        assigns(:rental).should be(mock_rental)
      end

      it "re-renders the 'new' template" do
        Rental.stub(:new) { mock_rental(:save => false) }
        post :create, :rental => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested rental" do
        Rental.should_receive(:find).with("37") { mock_rental }
        mock_rental.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :rental => {'these' => 'params'}
      end

      it "assigns the requested rental as @rental" do
        Rental.stub(:find) { mock_rental(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:rental).should be(mock_rental)
      end

      it "redirects to the rental" do
        Rental.stub(:find) { mock_rental(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(rental_url(mock_rental))
      end
    end

    describe "with invalid params" do
      it "assigns the rental as @rental" do
        Rental.stub(:find) { mock_rental(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:rental).should be(mock_rental)
      end

      it "re-renders the 'edit' template" do
        Rental.stub(:find) { mock_rental(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested rental" do
      Rental.should_receive(:find).with("37") { mock_rental }
      mock_rental.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the rentals list" do
      Rental.stub(:find) { mock_rental }
      delete :destroy, :id => "1"
      response.should redirect_to(rentals_url)
    end
  end

end
