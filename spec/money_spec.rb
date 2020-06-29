require 'spec_helper'

describe Money do
  context 'with custom configuration' do
    subject { Money.from_amount(574301550, "IDR").format }

    it 'give correct format' do
      expect(subject).to eq "Rp574.301.550,00"
    end
  end

  context 'with rounding_mode ROUND_HALF_EVEN' do
    it 'give correct round value' do
      expect(Money.from_amount(5.222, 'USD').to_f).to eq 5.22
      expect(Money.from_amount(5.227, 'USD').to_f).to eq 5.23
    end
  end
end
