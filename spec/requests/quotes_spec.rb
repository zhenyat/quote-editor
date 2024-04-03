require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/quotes", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Quote. As you add validations to Quote, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    # skip("Add a hash of attributes valid for your model")
    { name: Faker::Quote.fortune_cookie }
    # { name: "Superman" }
  }

  let(:invalid_attributes) {
    # skip("Add a hash of attributes invalid for your model")
    { name: "" }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Quote.create! valid_attributes
      get quotes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      quote = Quote.create! valid_attributes
      get quote_url(quote)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_quote_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      quote = Quote.create! valid_attributes
      get edit_quote_url(quote)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Quote" do
        expect {
          post quotes_url, params: { quote: valid_attributes }
        }.to change(Quote, :count).by(1)
      end

      it "redirects to the created quote" do
        post quotes_url, params: { quote: valid_attributes }
        expect(response).to redirect_to(quote_url(Quote.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Quote" do
        expect {
          post quotes_url, params: { quote: invalid_attributes }
        }.to change(Quote, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post quotes_url, params: { quote: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        # skip("Add a hash of attributes valid for your model")
        { name: Faker::Quote.fortune_cookie }
        # or: {name: 'Updated'}
      }

      it "updates the requested quote" do
        quote = Quote.create! valid_attributes
        patch quote_url(quote), params: { quote: new_attributes }
        quote.reload
        # skip("Add assertions for updated state")
        new_attributes.each_pair do |key, value|
          expect(quote[key]).to eq(value)
        end
      end

      it "redirects to the quote" do
        quote = Quote.create! valid_attributes
        patch quote_url(quote), params: { quote: new_attributes }
        quote.reload
        expect(response).to redirect_to(quote_url(quote))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        quote = Quote.create! valid_attributes
        patch quote_url(quote), params: { quote: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested quote" do
      quote = Quote.create! valid_attributes
      expect {
        delete quote_url(quote)
      }.to change(Quote, :count).by(-1)
    end

    it "redirects to the quotes list" do
      quote = Quote.create! valid_attributes
      delete quote_url(quote)
      expect(response).to redirect_to(quotes_url)
    end
  end
end
