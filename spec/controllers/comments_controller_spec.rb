require 'spec_helper'

describe CommentsController do 
  context 'routing' do
    it {should route(:get, '/comments/new').to :action => :new}
    it {should route(:post, '/comments').to :action => :create }
    it {should route(:get, '/comments/1').to :action => :show, :id =>1}
    it {should route(:put, '/comments/1').to :action => :update, :id => 1}
    it {should route(:delete, '/comments/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/comments').to :action => :index}
  end

  let(:user) {FactoryGirl.create :user}
  let(:article) {FactoryGirl.create :article}


  context 'GET new' do 
    before {get :new, {}, 'user_id' => user.id}

    it {should render_template :new}
  end
  
  context 'POST create' do
    context 'with valid parameters' do 
      let(:valid_attributes) {{text: "loved this article", article_id: article.id}}
      let(:valid_parameters) {{:comment => valid_attributes}}

      it 'creates a new comment' do
        expect {post :create, valid_parameters, 'user_id' => user.id, 'article_id' => article.id}.to change(Comment, :count).by(1)
      end

      before {post :create, valid_parameters, 'user_id' => user.id, 'article_id' => article.id}
      it {should redirect_to action: "new"}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameter' do
      let(:invalid_attributes) {{text: ''}}
      let(:invalid_parameters) {{:comment => invalid_attributes}}

      before {post :create, invalid_parameters, 'user_id' => user.id, 'article_id' => article.id}
      it {should render_template :new}
      it {should set_the_flash[:alert]}
      
    end
  end
end