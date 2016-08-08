require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :title => "MyString",
      :description => "MyString",
      :user_id => "MyString"
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "input#task_description[name=?]", "task[description]"

      assert_select "input#task_user_id[name=?]", "task[user_id]"
    end
  end
end
