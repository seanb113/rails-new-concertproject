describe "review creation", type: :feature do
        before do
          visit new_review_path
          fill_in "Title", with: "Worst Concert Ever"
          fill_in "Content", with: "This was the worst concert ever"
          fill_in "Rating", with: 2
          click_button "Create Review"
        end
end