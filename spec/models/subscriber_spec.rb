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

      it "creates an unsubscribe token" do
        expect(@subscriber.token).to_not be_nil
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

  describe '#generate_unsubscribe_token' do
    before do
      @new_sub = Subscriber.new(email: Faker::Internet.email)
      @new_sub.generate_unsubscribe_token
    end

    it "generates a token" do
      expect(@new_sub.token).to_not be_nil
    end

    it "generates a new token when called again" do
      original = @new_sub.token.to_s
      puts original
      @new_sub.generate_unsubscribe_token 
      puts @new_sub.token
      expect(@new_sub.token).to_not eq(original)
    end

    it "is unique" do
      expect(Subscriber.where(token: @new_sub.token).count).to eq(0)
    end

  end

end
