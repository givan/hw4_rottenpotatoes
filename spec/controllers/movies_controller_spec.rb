require 'spec_helper'

describe MoviesController do
#  fixture :movies
  describe 'creating a new movie' do

    before :each do
       @fake_movie = mock('mock_movie')
    end

    it 'should call the model method that creates a movie' do
      #fake_movie = mock('fake_movie')
      @fake_movie.should_receive(:title).and_return('my movie title')
      Movie.should_receive(:create!).and_return(@fake_movie)

      post :create, {:movie => @fake_movie }
    end

    it 'should forward on the index page view' do
       Movie.stub(:find).and_return(@fake_movie)
       @fake_movie.stub(:title).and_return('my movie title')
       @fake_movie.stub(:destroy)

       post :destroy, {:id => @fake_movie }

       response.should render_template(’index’)
    end
  end

  describe 'destroying a movie' do
    before :each do
      @fake_movie = mock('mock_movie')
    end

    it 'should find the movie with the specified id' do
       @fake_movie.stub(:title).and_return('my movie title')
       @fake_movie.stub(:destroy)

       Movie.should_receive(:find).and_return(@fake_movie)

       post :destroy, {:id => @fake_movie }
    end

    it 'should call delete method on the found movie' do
       Movie.stub(:find).and_return(@fake_movie)
       @fake_movie.stub(:title).and_return('my movie title')

       @fake_movie.should_receive(:destroy)

       post :destroy, {:id => @fake_movie }
    end   

    it 'should forward on the index page view' do
       Movie.stub(:find).and_return(@fake_movie)
       @fake_movie.stub(:title).and_return('my movie title')
       @fake_movie.stub(:destroy)

       post :destroy, {:id => @fake_movie }

       response.should render_template(’index’)
    end
  end

end
