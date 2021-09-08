require 'strscan'

describe 'Acceptance spec' do
	it 'implements the interface shown in the StringScanner docs' do
		# Arrange
		s = StringScanner.new('This is an example string')

		# Act & Assert
		expect(s.eos?).to eq false

		expect(s.scan(/\w+/)).to eq "This"
		expect(s.scan(/\w+/)).to eq nil
		expect(s.scan(/\s+/)).to eq " "
		expect(s.scan(/\s+/)).to eq nil
		expect(s.scan(/\w+/)).to eq "is"
		expect(s.eos?).to eq false

		expect(s.scan(/\s+/)).to eq " "
		expect(s.scan(/\w+/)).to eq "an"
		expect(s.scan(/\s+/)).to eq " "
		expect(s.scan(/\w+/)).to eq "example"
		expect(s.scan(/\s+/)).to eq " "
		expect(s.scan(/\w+/)).to eq "string"
		expect(s.eos?).to eq true

		expect(s.scan(/\s+/)).to eq nil
		expect(s.scan(/\w+/)).to eq nil
	end
end