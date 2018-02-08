require "rails_helper"
RSpec.describe UsersController do
    let(:first_user) { User.new(name: "Example",surname: "User", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }
    describe '#user' do
        it 'should be valid' do
            expect(first_user).to respond_to(:name, :email)
        end
        it 'name should be present' do
            first_user.name = "     "
            expect(first_user.valid?).to_not eq true
        end
        it 'surname should be present' do
            first_user.surname = "     "
            expect(first_user.valid?).to_not eq true
        end
        it 'surname should not be too long' do
            first_user.surname =  "a" * 51
            expect(first_user.valid?).to_not eq true
        end
        it 'email should be present' do
            first_user.email = "     "
            expect(first_user.valid?).to_not eq true
        end
        it 'name should not be too long' do
            first_user.name =  "a" * 51
            expect(first_user.valid?).to_not eq true
        end
        it 'password should be present (nonblank)' do
            first_user.password = first_user.password_confirmation = " " * 6
            expect(first_user.valid?).to_not eq true
        end
        it 'password should have a minimum length' do
            first_user.password = first_user.password_confirmation = "a" * 5
            expect(first_user.valid?).to_not eq true
        end
        it 'email should not be too long' do
            first_user.email = "a" * 244 + "@example.com"
            expect(first_user.valid?).to_not eq true
        end
        it 'email validation should accept valid addresses' do
            @invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
            @invalid_addresses.each do |invalid_address|
            first_user.email = invalid_address
            expect(first_user.valid?).to_not eq true
            end
        end
        it 'email addresses should be unique' do
            @duplicate_user = first_user
            first_user.save
            expect(@duplicate_user.save).to_not eq true
        end
        it 'email addresses should be saved as lower-case' do
            @mixed_case_email = "FoO@ExAMPle.CoM"
            first_user.email = @mixed_case_email
            first_user.save
            expect(@mixed_case_email.downcase).to eq first_user.reload.email
        end
    end
end