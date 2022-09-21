class Permission < ApplicationRecord
    has_many :roles, through: :role_permissions
    has_many :role_permissions

    validates :name, presence: true
end
