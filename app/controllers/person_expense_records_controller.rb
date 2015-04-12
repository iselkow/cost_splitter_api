class PersonExpenseRecordsController < ApplicationController
  before_action :set_person_expense_record, only: [:show, :update, :destroy]

  # GET /person_expense_records
  # GET /person_expense_records.json
  def index
    @person_expense_records = PersonExpenseRecord.all

    render json: @person_expense_records
  end

  # GET /person_expense_records/1
  # GET /person_expense_records/1.json
  def show
    render json: @person_expense_record
  end

  # POST /person_expense_records
  # POST /person_expense_records.json
  def create
    @person_expense_record = PersonExpenseRecord.new(person_expense_record_params)

    if @person_expense_record.save
      render json: @person_expense_record, status: :created, location: @person_expense_record
    else
      render json: @person_expense_record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /person_expense_records/1
  # PATCH/PUT /person_expense_records/1.json
  def update
    @person_expense_record = PersonExpenseRecord.find(params[:id])

    if @person_expense_record.update(person_expense_record_params)
      head :no_content
    else
      render json: @person_expense_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /person_expense_records/1
  # DELETE /person_expense_records/1.json
  def destroy
    @person_expense_record.destroy

    head :no_content
  end

  private

    def set_person_expense_record
      @person_expense_record = PersonExpenseRecord.find(params[:id])
    end

    def person_expense_record_params
      params[:person_expense_record]
    end
end
