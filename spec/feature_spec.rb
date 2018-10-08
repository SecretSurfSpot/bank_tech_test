require 'transaction'

describe 'Transaction Feature Tests' do

  it 'should initially have a balance of 0' do
    expect(subject.balance).to eq(0)
  end

end
