require 'rails_helper'

describe Contact do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid withou a first name ' do
        contact = Contact.new(last_name: 'Justamond', position: 'Developer', email: 'admin@admin.com', company_id: 1)
        expect(contact).to be_invalid
      end

      it 'is invalid withou a last name ' do
        contact = Contact.new(first_name: 'Chantal', position: 'Developer', email: 'admin@admin.com', company_id: 1)
        expect(contact).to be_invalid
      end

      it 'is invalid withou a position ' do
        contact = Contact.new(first_name: 'Chantal', last_name: 'Justamond', email: 'admin@admin.com', company_id: 1)
        expect(contact).to be_invalid
      end

      it 'is invalid withou a email ' do
        contact = Contact.new(first_name: 'Chantal', last_name: 'Justamond', position: 'Developer', company_id: 1)
        expect(contact).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a full name, position and email' do
        contact = Contact.new(first_name: 'Chantal', last_name: 'Justamond', position: 'Developer', email: 'admin@admin.com', company_id: 1)
        expect(contact).to be_valid
      end
    end

    describe 'relationships' do
      it 'belongs to a company ' do
        contact = Contact.new(first_name: 'Chantal', last_name: 'Justamond', position: 'Developer', email: 'admin@admin.com', company_id: 1)
        expect(contact).to respond_to(:company)
      end
    end

  end
end