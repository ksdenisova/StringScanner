require "kseniia_strscan"

describe KseniiaStrscan do
	describe 'init' do
		it 'initialized correctly with string' do
			subject = KseniiaStrscan.new('abc def')
			expect{subject}.not_to raise_error
		end
	end

	describe 'eos?' do
		it 'returns false if string is not empty' do
			subject = KseniiaStrscan.new('abc def')
			expect(subject.eos?).to eq false
		end

		it 'returns true if string is empty' do
			subject = KseniiaStrscan.new('')
			expect(subject.eos?).to eq true
		end
	end

	describe 'scan' do
		it 'receives regex and returns its first match' do
			subject = KseniiaStrscan.new('abc def')
			expect(subject.scan(/\w+/)).to eq 'abc'
		end

		it 'returns nil when regex does not match begining of string' do
			subject = KseniiaStrscan.new('abc def')
			expect(subject.scan(/\s+/)).to eq nil
		end

		it 'remembers its place in string' do
			subject = KseniiaStrscan.new('abc def')
			expect(subject.scan(/\w+/)).to eq 'abc'
			expect(subject.scan(/\s+/)).to eq ' '
			expect(subject.scan(/\w+/)).to eq 'def'
		end

		it 'does not consume original string' do
			# Given
			string = 'abc def'

			# Wnen
			subject = KseniiaStrscan.new(string)
			subject.scan(/\w+/)

			# Then
			expect(string).to eq 'abc def'
		end
	end
end