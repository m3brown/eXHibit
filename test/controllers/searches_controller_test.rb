require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  describe '#search' do
    it 'should call the IMDB service with the correct parameters' do
      # Arrange
      search_text = 'batman'
      ImdbService.expects(:search)
        .with(search_text)
        .returns({ Search: [] }.stringify_keys)

      # Act
      get :search, search: { title: 'batman' }

      # Assert
      # verify expectations
    end

    it 'should set @streams on the page for valid searches' do
      # Arrange
      expected_streams = { Search: ['I am a stream'] }.stringify_keys
      ImdbService.stubs(:search).returns(expected_streams)

      # Act
      get :search, search: { title: 'batman' }

      # Assert
      assert_equal expected_streams, assigns(:streams)
    end

    it 'should show a flash message for valid searches' do
      # Arrange
      expected_streams = { Search: ['I am a stream'] }.stringify_keys
      ImdbService.stubs(:search).returns(expected_streams)

      # Act
      get :search, search: { title: 'batman' }

      # Assert
      assert_not_nil flash[:notice]
    end

    it 'should render the search template' do
      # Arrange
      expected_streams = { Search: ['I am a stream'] }.stringify_keys
      ImdbService.stubs(:search).returns(expected_streams)

      # Act
      get :search, search: { title: 'batman' }

      # Assert
      assert_template 'searches/search'
      assert_template partial: 'searches/_stream_list'
      assert_select '#results'
    end
  end
end
