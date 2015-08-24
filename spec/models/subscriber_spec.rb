require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  describe '.subscribe' do
    context 'new email address' do
      before do
        @email = Faker::Internet.email
        @subscriber = Subscriber.subscribe(@email) 
      end

      it "returns a subscriber object" do
        expect(@subscriber).to be_a(Subscriber)
      end

      it "stores the email address" do
        expect(@subscriber.email).to eq(@email)
      end

      it "is the only record for this email" do
        expect(Subscriber.where(email: @email).count).to eq(1)
      end

    end

    context 'existing email address' do
      before do
        @email = Faker::Internet.email
        @existing_subscriber = Subscriber.subscribe(@email)
      end


      it "returns a subscriber object" do
        expect(Subscriber.subscribe(@email)).to be_a(Subscriber)
      end

      it "returns the existing object" do
        expect(Subscriber.subscribe(@email)).to eq(@existing_subscriber)
      end

      it "is the only record for this email" do
        expect(Subscriber.where(email: @email).count).to eq(1)
      end
    end


  end
end
