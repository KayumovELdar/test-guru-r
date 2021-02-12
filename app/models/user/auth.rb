module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :name, :email, presence: true
    validates_uniqueness_of :email
    validates :email, uniqueness: true,
                  format: { with: URI::MailTo::EMAIL_REGEXP,
                            message: 'Формат почты: name@post.com' }
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
