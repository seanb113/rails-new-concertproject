describe Location do
    let(:attributes) do
        {
          name: "Washington D.C."
        }
      end
     
      it "is considered valid" do
        expect(Location.new(attributes)).to be_valid
      end
    end