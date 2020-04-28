module RequestrMacros
  def login
    let(:test) { create(:test) }
    before do
      sign_in test
    end
  end

  def login_keep
    let(:user) { create(:user) }
    before do
      sign_in user
    end
  end
end
