module RequestrMacros
  def login
    let(:test) { create(:test) }
    before do
      sign_in test
    end 
  end
end