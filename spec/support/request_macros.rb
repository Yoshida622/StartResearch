module RequestrMacros
  def login
    let(:test) { create(:test) }
    sign_in test
  end
end