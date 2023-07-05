class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :expenses, class_name: 'Expense', foreign_key: 'author_id'
  has_many :my_groups, class_name: 'MyGroup', foreign_key: 'author_id'

  validates :name, presence: true
end
