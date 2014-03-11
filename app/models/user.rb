class User < ActiveRecord::Base
  before_validation :sanitize_ssn
  validates :ssn, :format => /\A\d{9}\z/, :if => -> { ssn.present? }

  private
  def sanitize_ssn
    ssn.gsub!(/\D/, '') if ssn
  end
end
