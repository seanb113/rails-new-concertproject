describe Artist do
let(:attributes) do
    {
      name: "Lynard Skynard",
      genre: "Rock",
      bio: "From Sweet Home Alabama"
    }
  end
 
  it "is considered valid" do
    expect(Artist.new(attributes)).to be_valid
  end
end