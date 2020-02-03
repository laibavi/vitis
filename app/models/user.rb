class User < ApplicationRecord
    has_many :bills, dependent: :destroy

    has_secure_password
    validates :name, presence: true, length: {maximum: 30}
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    validates :age, presence: true, numericality:{ only_integer: true, less_than: 120}
    validates :phone, presence: true, numericality: true, length:{minimum: 9, maximum: 15}
    attr_accessor :remember_token

    # mã hóa băm của chuỗi
    def User.digest string
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
                                                    BCrypt::Password.create(string, cost: cost)
    end

    # trả v mã random
    def User.new_token
       SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute :remember_digest, User.digest(remember_token)
    end

# sso sánh với cookie
    def authenticated? remember_token
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        update_attribute :remember_digest, nil
    end

    def u_phone
      "0#{self.phone}"
    end

end
