require 'spec_helper'

describe Money do
  context 'with custom configuration' do
    subject { Money.from_amount(574301550, "IDR").format }

    it 'give correct format' do
      expect(subject).to eq "Rp574.301.550,00"
    end 
  end
end