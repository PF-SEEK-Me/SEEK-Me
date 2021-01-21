require "rails_helper"

def full_name(user)
  user.last_name + " " + user.first_name
end

RSpec.describe Customer, type: :model do
  describe "#create" do
    context "会員登録が正しく保存されていること" do
      it "会員登録が正しく保存されること" do
        customer = Customer.new(
                   last_name: "試験",
                   first_name: "試験",
                   last_name_kana: "シケン",
                   first_name_kana: "シケン",
                   gender: 0,
                   age: 20,
                   email: "siken@gmail.com",
                   password: "siken9999",
                   postal_code: "9999999",
                   address: "シケン住所",
                   telephone_number: "08099999999",
                   is_student: true,
                   is_active: true
        )
        expect(full_name(customer)).to eq "試験 試験"
      end
    end

    context "会員登録情報に不備があれば登録できない" do
      it "会員登録情報に不備があれば登録できない" do
        customer = Customer.new(
                   last_name: nil,
                   first_name: "試験",
                   last_name_kana: "シケン",
                   first_name_kana: "シケン",
                   gender: 0,
                   age: 20,
                   email: "siken@gmail.com",
                   password: "siken9999",
                   postal_code: "9999999",
                   address: "シケン住所",
                   telephone_number: "08099999999",
                   is_student: true,
                   is_active: true
        )
        expect(customer).not_to be_valid
      end
    end
  end
end