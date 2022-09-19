require 'rails_helper'

 RSpec.describe User, type: :model do
   before do
    @user = FactoryBot.build(:user)
   end

   describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
     it 'nick_name,email,password,last_name,first_name,last_name_kana,first_name_kana,birthが入力されていること' do
     expect(@user).to be_valid
     end
    end
    context '新規登録できないとき' do
     it 'nick_nameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
     end
     it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end
     it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it 'birthが空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
     end

     it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

     it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end

     it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
     end

     it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end

     it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
     end

     it 'first_name_kanaが半角では登録できない' do
      @user.first_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
     end
     it 'first_nameが半角では登録できない' do
      @user.first_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end
     it 'last_name_kanaが半角では登録できない' do
      @user.last_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
     end
     it 'last_nameが半角では登録できない' do
      @user.last_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it 'パスワードが数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'passwordが全角英数では登録できないこと' do
      
      @user.password = 'AiUeO1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
    end
  end
end
