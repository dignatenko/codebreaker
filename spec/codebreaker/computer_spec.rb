require 'spec_helper'

describe Codebreaker::Computer do
  context "secret code" do
    before do
      subject.generate_codes
    end
    it {expect(subject.instance_variable_get(:@secret_code)).not_to be_empty}
    it "size should be four" do
      expect(subject.instance_variable_get(:@secret_code).size).to eq 4
    end
  end

  context '#generate_code' do
    it "should return array with 4 values" do
      expect(subject.generate_codes.size).to eq 4
    end
    it "any number should be from 1 to 6" do
      i = rand(0..3)
      values = (1..6).to_a
      subject.generate_codes.each do |value|
        expect(value).to be > 0
        expect(value).to be <= 6
      end
    end
    it "should set result to @secret_code" do
      code = subject.generate_codes
      expect(subject.instance_variable_get(:@secret_code)).to eq code
    end
  end

  context "#hint" do
    before do
      subject.generate_codes
    end
    it "should return one of the values of the secret code" do
      expect(subject.instance_variable_get(:@secret_code)).to include subject.hint
    end
    it "should return hint just one time" do
      subject.hint
      expect(subject.hint).to eq 'You have no more hints'
    end
  end
end