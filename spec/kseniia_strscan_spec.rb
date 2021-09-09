require 'kseniia_strscan'

describe 'KseniiaStrscan init' do
	it 'is initialized with the string to scan' do
		# Given
		string = 'abc def'

		# When
		subject = KseniiaStrscan.new string

		# Then
		expect{subject}.not_to raise_error
	end
end 

describe 'KseniiaStrscan eos?' do
	it 'returns false when there is content left in the string' do
		# Given
		string = 'abc def'

		# When
		subject = KseniiaStrscan.new string

		# Then
		expect(subject.eos?).to eq false
	end

	it 'returns true when there is no content left in the string' do
		# Given
		string = ''

		# When
		subject = KseniiaStrscan.new string

		# Then
		expect(subject.eos?).to eq true
	end
end

describe 'KseniiaStrscan scan' do
	it 'receives a regex and return the first match' do
		# Given
		string = 'abc def'

		# When
		subject = KseniiaStrscan.new string 

		# Then
		expect(subject.scan(/\w+/)).to eq "abc"
	end

	it "returns nil when regex doesn't match the begining of the string" do 
		# Given
		string = 'abc def'

		# When
		subject = KseniiaStrscan.new string

		# Then
		expect(subject.scan(/\s+/)).to eq nil
	end

	it 'remembers it place in the string' do
		# Given
		string = 'abc def'

		# When
		subject = KseniiaStrscan.new string

		# Then
		expect(subject.scan(/\w+/)).to eq "abc"
		expect(subject.scan(/\s+/)).to eq " " 
		expect(subject.scan(/\w+/)).to eq "def"
	end

	it 'does not consume the original string' do
		# Given
		string = "abc def"

		# When
		KseniiaStrscan.new(string).scan(/\w+/)

		# Then
		expect(string).to eq "abc def"
	end
end