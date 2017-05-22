require 'rails_helper'

describe Tag do
  describe 'validations' do
    it 'is invalid without a title' do
      tag = Tag.new
      expect(tag).to be_invalid
    end

    it 'has a unique title ' do
      Tag.create!(title: 'ruby on rails')
      tag = Tag.new(title: "ruby on rails")

      expect(tag).to be_invalid
    end

    context 'valid attributes' do
      it 'is valid with a title' do
        tag = Tag.new(title: 'ruby')

        expect(tag).to be_valid
      end
    end

    describe 'relationships' do
      it 'has many jobs' do
        tag = Tag.new(title: 'ruby on rails')
        expect(tag).to respond_to(:jobs)
      end
    end
  end
end