class EmailValidatorService
  attr_reader :email
  def initialize(email:)
    @email = email
  end

  def valid?
    response = Abstract.new(email: email).call
    return false unless response

    response["quality_score"].to_f > 0.7
  rescue StandardError
    false
  end
end
