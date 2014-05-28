require 'active_record'

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string     :name
    t.string     :email
    t.string     :phone
  end
end

ActiveRecord::Schema.define do
  create_table :complaints, force: true do |t|
    t.integer    :user_id
    t.string     :message
  end
end
