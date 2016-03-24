require 'test_helper'

class ImdbConsumeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ImdbConsume::VERSION
  end

  describe '#search' do
    it 'should parse the json in the body when we get a response' do
      # Arrange
      expected_result = { foo: 'bar' }.stringify_keys
      response = Typhoeus::Response.new(code: 200,
                                        body: expected_result.to_json)
      Typhoeus.stubs(:get).returns(response)

      # Act
      result = ImdbConsume::Stream.search('something')

      # Assert
      assert_equal expected_result, result
    end

    it 'should return an empty array if there is no search result' do
      # Arrange
      Typhoeus.stubs(:get).returns([])

      # Act
      result = ImdbConsume::Stream.search('something')

      # Assert
      assert_equal [], result
    end

    it 'should pass the correct parameters to the request' do
      # Arrange
      expected_url = "#{ImdbConsume.remote_domain}s=batman&y=&plot=&r=json"
      search_response = Typhoeus::Response.new(code: 200,
                                               body: { foo: 'bar' }.to_json)
      Typhoeus.expects(:get).with(expected_url).returns(search_response)

      # Act
      ImdbConsume::Stream.search('batman')

      # Assert
      # verify expectations
    end

    it 'should only be called one time' do
      # Arrange
      expected_url = "#{ImdbConsume.remote_domain}s=batman&y=&plot=&r=json"
      search_response = Typhoeus::Response.new(code: 200, body: { foo: 'bar' }.to_json)
      Typhoeus.expects(:get).with(expected_url).once.returns(search_response)

      # Act
      ImdbConsume::Stream.search('batman')

      # Assert
      # verify expectations
    end

    it 'should only be called one time' do
      # Arrange
      expected_url = "#{ImdbConsume.remote_domain}s=batman&y=&plot=&r=json"
      search_response = Typhoeus::Response.new(code: 200, body: { foo: 'bar' }.to_json)
      Typhoeus.expects(:get).with(expected_url).returns(search_response)
      Typhoeus.expects(:post).never

      # Act
      ImdbConsume::Stream.search('batman')

      # Assert
      # verify expectations
    end
  end
end
