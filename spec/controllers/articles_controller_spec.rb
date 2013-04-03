require 'spec_helper'

describe ArticlesController  do

  context 'routing' do
    it {should route(:get, '/articles/new').to :action => :new}
    it {should route(:post, '/articles').to :action => :create }
    it {should route(:get, '/articles/1').to :action => :show, :id =>1}
    it {should route(:get, '/articles/1/edit').to :action => :edit, :id => 1}
    it {should route(:put, '/articles/1').to :action => :update, :id => 1}
    it {should route(:delete, '/articles/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/articles').to :action => :index}
  end

  let(:user) {FactoryGirl.create :user}

  context 'GET new' do 
    before {get :new, {}, 'user_id' => user.id}

    it {should render_template :new}
  end

  context 'POST create' do
    context 'with valid parameters' do 
      let(:valid_attributes) {{title: "whacky subterranean Nessie", author: 'Dorrit Marciemo', link: 'http://somethingweird.gov'}}
      let(:valid_parameters) {{:article => valid_attributes}}

      it 'creates a new article' do
        expect {post :create, valid_parameters, 'user_id' => user.id}.to change(Article, :count).by(1)
      end

      before {post :create, valid_parameters, 'user_id' => user.id}
      it {should redirect_to action: "index"}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameter' do
      let(:invalid_attributes) {{title: '', author: '', link: ''}}
      let(:invalid_parameters) {{:article => invalid_attributes}}

      before {post :create, invalid_parameters, 'user_id' => user.id}
      it {should render_template :new}
      it {should set_the_flash[:alert]}
      
    end
  end

  context 'GET index' do
    before {get :index, {}, 'user_id' => user.id}

    it {should render_template :index}
  end

  context 'GET edit' do
    let(:article) {FactoryGirl.create :article}
    before {get :edit, {:id => article.id}, {'user_id' => user.id}}

    it {should render_template :edit}
  end

  context 'PUT update' do
    let(:article) {FactoryGirl.create :article}

    context 'with valid parameters' do 
      let(:valid_attributes) {{title: "fish who lie"}}
      let(:valid_parameters) {{id: article.id, article: valid_attributes}}
      before {put :update, valid_parameters, 'user_id' => user.id}

      it 'updates the article' do
        Article.find(article.id).title.should eq valid_attributes[:title]
      end

      it {should redirect_to action: "index"}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{title: ''}}
      let(:invalid_parameters) {{id: article.id, article: invalid_attributes}}
      before {put :update, invalid_parameters, 'user_id' => user.id}

      it {should render_template :edit}
      it {should set_the_flash[:alert]}
    end
  end

  context 'DELETE destroy' do 
    it 'destroys an article' do 
      article = FactoryGirl.create :article
      expect {delete :destroy, {:id => article.id}, 'user_id' => user.id}.to change(Article, :count).by(-1)
    end
  end

end