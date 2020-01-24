describe Concert do
let(:attributes) do
        {
          name: "Lynard Skynard 2020",
          venue_id: 1,
          date: DateTime.new(2020,1,24,19)
        }
      end
     
      it "is considered valid" do
        expect(Concert.new(attributes)).to be_valid
      end
    end