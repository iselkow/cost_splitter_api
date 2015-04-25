require 'rails_helper'

RSpec.describe PersonSerializer, type: :model do
  subject { described_class.new(person) }
  let(:person) { Person.new(id: 12, name: "Paul Walker", paid: false) }

  before do
    allow(person).to receive(:balance) { 10 }
  end

  it 'serializes the person' do
    data = JSON.parse(subject.to_json)
    expect(data['person'].keys).to eq(%w{id name paid balance})

    expect(data['person']['id']).to eq 12
    expect(data['person']['name']).to eq 'Paul Walker'
    expect(data['person']['paid']).to eq false
    expect(data['person']['balance']).to eq 10
  end
end
