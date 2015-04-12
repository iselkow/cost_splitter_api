require 'rails_helper'

RSpec.describe PersonExpenseRecordsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # PersonExpenseRecord. As you add validations to PersonExpenseRecord, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PersonExpenseRecordsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all person_expense_records as @person_expense_records" do
      person_expense_record = PersonExpenseRecord.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:person_expense_records)).to eq([person_expense_record])
    end
  end

  describe "GET #edit" do
    it "assigns the requested person_expense_record as @person_expense_record" do
      person_expense_record = PersonExpenseRecord.create! valid_attributes
      get :edit, {:id => person_expense_record.to_param}, valid_session
      expect(assigns(:person_expense_record)).to eq(person_expense_record)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new PersonExpenseRecord" do
        expect {
          post :create, {:person_expense_record => valid_attributes}, valid_session
        }.to change(PersonExpenseRecord, :count).by(1)
      end

      it "assigns a newly created person_expense_record as @person_expense_record" do
        post :create, {:person_expense_record => valid_attributes}, valid_session
        expect(assigns(:person_expense_record)).to be_a(PersonExpenseRecord)
        expect(assigns(:person_expense_record)).to be_persisted
      end

      it "redirects to the created person_expense_record" do
        post :create, {:person_expense_record => valid_attributes}, valid_session
        expect(response).to redirect_to(PersonExpenseRecord.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved person_expense_record as @person_expense_record" do
        post :create, {:person_expense_record => invalid_attributes}, valid_session
        expect(assigns(:person_expense_record)).to be_a_new(PersonExpenseRecord)
      end

      it "re-renders the 'new' template" do
        post :create, {:person_expense_record => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested person_expense_record" do
        person_expense_record = PersonExpenseRecord.create! valid_attributes
        put :update, {:id => person_expense_record.to_param, :person_expense_record => new_attributes}, valid_session
        person_expense_record.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested person_expense_record as @person_expense_record" do
        person_expense_record = PersonExpenseRecord.create! valid_attributes
        put :update, {:id => person_expense_record.to_param, :person_expense_record => valid_attributes}, valid_session
        expect(assigns(:person_expense_record)).to eq(person_expense_record)
      end

      it "redirects to the person_expense_record" do
        person_expense_record = PersonExpenseRecord.create! valid_attributes
        put :update, {:id => person_expense_record.to_param, :person_expense_record => valid_attributes}, valid_session
        expect(response).to redirect_to(person_expense_record)
      end
    end

    context "with invalid params" do
      it "assigns the person_expense_record as @person_expense_record" do
        person_expense_record = PersonExpenseRecord.create! valid_attributes
        put :update, {:id => person_expense_record.to_param, :person_expense_record => invalid_attributes}, valid_session
        expect(assigns(:person_expense_record)).to eq(person_expense_record)
      end

      it "re-renders the 'edit' template" do
        person_expense_record = PersonExpenseRecord.create! valid_attributes
        put :update, {:id => person_expense_record.to_param, :person_expense_record => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested person_expense_record" do
      person_expense_record = PersonExpenseRecord.create! valid_attributes
      expect {
        delete :destroy, {:id => person_expense_record.to_param}, valid_session
      }.to change(PersonExpenseRecord, :count).by(-1)
    end

    it "redirects to the person_expense_records list" do
      person_expense_record = PersonExpenseRecord.create! valid_attributes
      delete :destroy, {:id => person_expense_record.to_param}, valid_session
      expect(response).to redirect_to(person_expense_records_url)
    end
  end

end
