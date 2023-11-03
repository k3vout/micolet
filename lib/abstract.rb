class Abstract
  include HTTParty
  base_uri 'https://emailvalidation.abstractapi.com'

  attr_reader :email
  def initialize(email:)
    @email = email
  end

  def call
    self.class.get('/v1/', query: query)
  end

  private

  def query
    {
      api_key: ENV['ABSTRACT_API_KEY'],
      email: email
    }
  end
end
