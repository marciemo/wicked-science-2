require 'spec_helper'

# describe UsersController do
#   context 'POST create' do
#     context 'with valid parameters' do 
#       let(:valid_attributes) {{email: "dorrit@riseup.net", password: 'kinky', password_confirmation: 'kinky'}}
#       let(:valid_parameters) {{:user => valid_attributes}}

#       it 'creates a new user' do
#         expect {post :create, valid_parameters}.to change(User, :count).by(1)
#       end

#       before {post :create, valid_parameters}
#       it {should redirect_to action: "index"}
#     end

#     context 'with invalid parameter' do
#       let(:invalid_attributes) {{email: '', password: '', password_confirmation: ''}}
#       let(:invalid_parameters) {{:user => invalid_attributes}}

#       before {post :create, invalid_parameters}
#       it {should render_template :new}
#     end
#   end
# end
