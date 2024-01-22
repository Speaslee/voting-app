class User < ApplicationRecord
  attr_accessor :skip_password_validation

  devise :registerable, :validatable, :timeoutable, :trackable
  has_one :vote

  validates_uniqueness_of :email
  validates_length_of :zipcode, :is=>5, :message=>"please enter a valid 5 digit zipcode"
  
  def voted?
    vote.present?
  end

  def sign_out_in
    (current_sign_in_at + 5.minutes).to_datetime.to_i * 1000.0
  end

  protected
    def password_required?
      false
    end

    def valid_password?
      true
    end

    def user_params
      params.require(:user).permit(:email, :zipcode)
    end

end
