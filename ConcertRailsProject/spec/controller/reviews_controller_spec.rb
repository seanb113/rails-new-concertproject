describe ReviewsController, type: :controller do
    let(:attributes) do
      {
        Title: "Worst Concert Ever",
        size: "This was the worst concert ever",
        rating: 2
      }
    end
   
    it "renders the show template" do
      review = Review.create!(attributes)
      get :show, id: review.id
      expect(response).to render_template(:show)
    end
   
    describe "creation" do
      before { post :create, review: attributes }
      let(:review) { Review.find_by(title: "Worst Concert Ever") }
   
      it "creates a new review" do
        expect(review).to_not be_nil
      end
   
      it "redirects to the concerts show page" do
        expect(response).to redirect_to(concert_path(review.concert_id))
      end
    end
  end