require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:users) { create_list(:users, 10) }

end
