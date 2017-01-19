feature "login/logout" do
  before(:all) do
    @user = create(:user)
  end

  after(:all) do
    @user.destroy
  end

  scenario "login/logout" do
    visit '/'
    click_on 'Login'
    within("#login") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Create New Post'

    click_on 'Logout'
    expect(page).to have_content 'Login'
  end
end
