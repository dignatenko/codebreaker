require 'spec_helper'

describe Codebreaker::Compare do
  context "#compare_codes" do
    before do 
      secret_code = [1, 2, 3, 4]
      @compare = Codebreaker::Compare.new(secret_code)
    end

    it "should return '++++'" do
      expect(@compare.compare_codes([1, 2, 3, 4]).join).to eq '++++'
    end
    it "should return '++-'" do
      expect(@compare.compare_codes([1, 3, 5, 4]).join).to eq '++-'
    end
    it "should return '++-'" do
      expect(@compare.compare_codes([1, 1, 2, 4]).join).to eq '++-'
    end
    it "should return ''" do
      expect(@compare.compare_codes([6, 5, 6, 5]).join).to eq ''
    end
    it "should return '--'" do
      expect(@compare.compare_codes([6, 3, 2, 5]).join).to eq '--'
    end
    it "should return '+--'" do
      expect(@compare.compare_codes([2, 3, 2, 4]).join).to eq '+--'
    end
    it "should return '----'" do
      expect(@compare.compare_codes([4, 3, 2, 1]).join).to eq '----'
    end
    it "should return '++--'" do
      expect(@compare.compare_codes([1, 2, 4, 3]).join).to eq '++--'
    end
    it "should return '+-'" do
      expect(@compare.compare_codes([6, 2, 4, 5]).join).to eq '+-'
    end
    it "should return '--'" do
      expect(@compare.compare_codes([2, 5, 6, 1]).join).to eq '--'
    end
  end

end
