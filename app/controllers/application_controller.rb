class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    locale = extract_locale_from_accept_language_header
    I18n.locale = locale if locale.present?
  end

  private

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
