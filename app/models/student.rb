class Student < ActiveRecord::Base

  has_many :investments
  has_many :stocks, through: :investments
  belongs_to :teacher, :foreign_key => :teacher_email, primary_key: :email

  before_validation(on: :create) do
    self.access_code = rand.to_s[2..7]
    self.teacher_email.downcase!
  end

  default_scope { includes(:investments, :stocks, :teacher) }

  validates :name, presence: true
  validates :access_code, presence: true
  validates :teacher_email, format: {
                              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              message: "must be a valid email address."
                          }

  def current_year
    teacher.current_year
  end

  def portfolio_value
    investments.reduce(0) { |s, i| s + i.value_in(current_year)}
  end
end
