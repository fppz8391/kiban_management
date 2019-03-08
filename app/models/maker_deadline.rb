class MakerDeadline < ApplicationRecord
    validates :メーカー, presence: true
    validates :期限, presence: true
end
