require "test_helper"

class EmailContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get email_contacts_new_url
    assert_response :success
  end

  test "should get create" do
    get email_contacts_create_url
    assert_response :success
  end
end
