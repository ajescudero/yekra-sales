describe User do
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :encrypted_password }
  it { is_expected.to have_db_column :approved }

  it { is_expected.to have_many :purchases }

  let(:user) { FactoryGirl.build :user }

  it 'fires set_approved method as after_save method callbacks' do
      expect(user).to receive(:set_approved)
      user.run_callbacks(:save)
  end
end