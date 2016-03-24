require 'test_helper'

class SearchesTest < ActiveSupport::TestCase
  describe 'validation' do
    it 'should not be valid without a title' do
      # Arrange
      search = Search.new

      # Act
      result = search.valid?

      # Assert
      refute result, 'Search objects must have a title'
      assert_not_empty search.errors
      assert_includes search.errors, :title
    end

    it 'should be valid with only a title' do
      # Arrange
      search = Search.new(title: 'batman')

      # Act
      result = search.valid?

      # Assert
      assert result, 'Search object should be valid with just a title'
    end
  end

  describe '#persisted?' do
    it 'should be false' do
      search = Search.new
      result = search.persisted?
      refute result, "persisted? should always return false, but was #{result}"
    end
  end
end
