class Kiban < ApplicationRecord
    validates :基板名, presence: true
    validates :最終注文日, presence: true
    validates :メーカー, presence: true
end
