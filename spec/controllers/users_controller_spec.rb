require 'spec_helper'

describe UsersController do
  subject {page}

  describe "signup page" do
    before {visit signup_path}

    it {should have_selector('div.container h2',text: '新規登録')}
    it {should have_selector('title',text: '新規登録 - hogehoge')}
  end
end
