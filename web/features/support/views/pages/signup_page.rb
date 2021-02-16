class SignupPage
  include Capybara::DSL

  def open
    visit "http://rocklov-web:3000/signup"
  end

  def create(user)
    find("#fullName").set user[:nome]
    find("#email").set user[:email]
    find("#password").set user[:senha]
    click_button "Cadastrar"
  end
end
