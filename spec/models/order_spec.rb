require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "#vailid?" do
    let(:name) { "高塩" }
    let(:email) { "takashio@example.com" }
    let(:telephone) { "09034747259" }
    let(:delivery_address) { "昭和村" }
    let(:params) do
      {
        name:,
        email:,
        telephone:,
        delivery_address:,
      }
    end

    subject { Order.new(params).valid? }

    it { is_expected.to eq true }

    context '名前が空欄の場合' do
      let(:name) { "" }

      it { is_expected.to eq false }
    end

    context 'メールアドレスが空欄の場合' do
      let(:email) { "" }

      it { is_expected.to eq false }
    end

    context 'メールアドレスの書式が正しくない場合' do
      let(:email) { "takashio.com" }

      it { is_expected.to eq false }
    end

    context 'メールアドレスが全角の場合' do
      let(:email) { "ｔａｋａｓｈｉｏ＠ｅｘａｍｐｌｅ.ｃｏｍ" }

      it { is_expected.to eq true }
    end

    context '電話番号が空欄の場合' do
      let(:telephone) { "" }

      it { is_expected.to eq false }
    end

    context '電話番号が全角の場合' do
      let(:telephone) { "０９０" }

      it { is_expected.to eq true }
    end

    context '電話番号にハイフンがある場合' do
      let(:telephone) { "０９０ー３４７" }

      it { is_expected.to eq true }
    end

    context '電話番号が12桁の場合' do
      let(:telephone) { "090347472591" }

      it { is_expected.to eq false }
    end

    context 'お届け先住所が空欄の場合' do
      let(:delivery_address) { "" }

      it { is_expected.to eq false }
    end
  end
end
