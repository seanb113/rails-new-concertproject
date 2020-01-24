describe Venue do
    let(:attributes) do
        {
          name: "Strathmore",
          location_id: 2,
          capacity: "200"
        }
      end
     
      it "is considered valid" do
        expect(Venue.new(attributes)).to be_valid
      end
    end