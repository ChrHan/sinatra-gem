require File.expand_path '../spec_helper.rb', __FILE__

describe "Sinatra Gem" do
  before :all do
    db = DatabaseWrapper.new()
    db.execute("CREATE TABLE PRODUCTS (
      id  INT PRIMARY KEY,
      product_name VARCHAR(20)
    );")
  end

  context "HTTP 200 Responses" do
    it "should allow accessing the home page" do
      get '/'
      # Rspec 2.x
      expect(last_response).to be_ok
    end
    it "should allow accessing select page" do
      get '/select'
      # Rspec 2.x
      expect(last_response).to be_ok
    end
    it "should allow accessing selectcount page" do
      get '/selectcount'
      # Rspec 2.x
      expect(last_response).to be_ok
      expect(last_response.body).to include("0") 
    end
  end

  context "Insert, Update and Delete Operations" do
    it "should allow inserting values" do
      get '/insert?id=223&product_name=fdsad'
      # Rspec 2.x
      expect(last_response).to be_ok
    end
    it "should return 1 from count" do
      get '/selectcount'
      # Rspec 2.x
      expect(last_response.body).to include("1") 
    end
    it "should return inserted value" do
      get '/select'
      # Rspec 2.x
      expect(last_response.body).to include("223") 
      expect(last_response.body).to include("fdsad") 
    end
    it "should allow updating values" do
      get '/update?id=223&product_name=updated_val'
      # Rspec 2.x
      expect(last_response).to be_ok
    end
    it "should return updated value" do
      get '/select'
      # Rspec 2.x
      expect(last_response.body).to include("223") 
      expect(last_response.body).to include("updated_val") 
    end
    it "should allow deleting created values" do
      get '/delete?id=223'
      # Rspec 2.x
      expect(last_response).to be_ok
    end
    it "should return 0 from count" do
      get '/selectcount'
      # Rspec 2.x
      expect(last_response.body).to include("0") 
    end
  end

  after :all do
    db = DatabaseWrapper.new()
    db.execute("drop table products")
  end
end
