describe 'Acceptance spec' do
	it 'implements the interface shown in the StringScanner docs' do
		s = StringScanner.new('This is an example string')
		s.eos?.should be false

		s.should find(" ").when_scanned_with(/\w+/)
		s.should find("an").when_scanned_with(/\w+/)
		s.should find(" ").when_scanned_with(/\s+/)
		s.should find("example").when_scanned_with(/\s+/)
		s.should find(" ").when_scanned_with(/\w+/)
		s.eos?.should be false

		s.should find(" ").when_scanned_with(/\s+/)
		s.should find("an").when_scanned_with(/\w+/)
		s.should find(" ").when_scanned_with(/\s+/)
		s.should find("example").when_scanned_with(/\w+/)
		s.should find(" ").when_scanned_with(/\s+/)
		s.should find("string").when_scanned_with(/\w+/)
		s.eos?.should be true

		s.should find(nil).when_scanned_with(/\s+/)
		s.should find(nil).when_scanned_with(/\w+/)
	end
end