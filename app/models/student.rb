class Student < ActiveRecord::Base

  before_validation(on: :create) do
    self.access_code = rand.to_s[2..7]
    self.teacher_email.downcase!
  end

  validates :name, presence: true
  validates :access_code, presence: true
  validates :teacher_email, format: {
                              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              message: "must be a valid email address."
                          }

end
