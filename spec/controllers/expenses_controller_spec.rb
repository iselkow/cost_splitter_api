require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Expense. As you add validations to Expense, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExpensesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all expenses as @expenses" do
      expense = Expense.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:expenses)).to eq([expense])
    end
  end

  describe "GET #edit" do
    it "assigns the requested expense as @expense" do
      expense = Expense.create! valid_attributes
      get :edit, {:id => expense.to_param}, valid_session
      expect(assigns(:expense)).to eq(expense)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Expense" do
        expect {
          post :create, {:expense => valid_attributes}, valid_session
        }.to change(Expense, :count).by(1)
      end

      it "assigns a newly created expense as @expense" do
        post :create, {:expense => valid_attributes}, valid_session
        expect(assigns(:expense)).to be_a(Expense)
        expect(assigns(:expense)).to be_persisted
      end

      it "redirects to the created expense" do
        post :create, {:expense => valid_attributes}, valid_session
        expect(response).to redirect_to(Expense.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved expense as @expense" do
        post :create, {:expense => invalid_attributes}, valid_session
        expect(assigns(:expense)).to be_a_new(Expense)
      end

      it "re-renders the 'new' template" do
        post :create, {:expense => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested expense" do
        expense = Expense.create! valid_attributes
        put :update, {:id => expense.to_param, :expense => new_attributes}, valid_session
        expense.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested expense as @expense" do
        expense = Expense.create! valid_attributes
        put :update, {:id => expense.to_param, :expense => valid_attributes}, valid_session
        expect(assigns(:expense)).to eq(expense)
      end

      it "redirects to the expense" do
        expense = Expense.create! valid_attributes
        put :update, {:id => expense.to_param, :expense => valid_attributes}, valid_session
        expect(response).to redirect_to(expense)
      end
    end

    context "with invalid params" do
      it "assigns the expense as @expense" do
        expense = Expense.create! valid_attributes
        put :update, {:id => expense.to_param, :expense => invalid_attributes}, valid_session
        expect(assigns(:expense)).to eq(expense)
      end

      it "re-renders the 'edit' template" do
        expense = Expense.create! valid_attributes
        put :update, {:id => expense.to_param, :expense => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested expense" do
      expense = Expense.create! valid_attributes
      expect {
        delete :destroy, {:id => expense.to_param}, valid_session
      }.to change(Expense, :count).by(-1)
    end

    it "redirects to the expenses list" do
      expense = Expense.create! valid_attributes
      delete :destroy, {:id => expense.to_param}, valid_session
      expect(response).to redirect_to(expenses_url)
    end
  end

end
