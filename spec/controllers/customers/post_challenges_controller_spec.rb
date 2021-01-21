require 'rails_helper'

RSpec.describe Customers::PostChallengesController, type: :controller do
  describe "#create" do
    context "チャレンジを投稿できること" do
      it "チャレンジを正常に投稿できること" do
        expect {
          post :create, params: {
            post_challenge: {
              customer_id: 1,
              article_id: 1,
              comment: "テストテストテスト"
            }
          }
        }
      end
    end

    context "commentがnilだと投稿できない" do
      it "commentがnilだと投稿できない" do
        expect {
          post :create, params: {
            post_challenge: {
              customer_id: 1,
              article_id: 2,
              comment: nil
            }
          }
        }
      end
    end
  end
end