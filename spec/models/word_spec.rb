require 'rails_helper'

describe Word do
  word = Word.new({word: 'foxes',root: 'fox'})

  it "exists" do
    expect(word).to be_a Word
  end

  context "instance methods" do
    context "#valid?" do
      it "returns true" do
        expect(word.valid?).to eq true
      end
    end
  end
end
