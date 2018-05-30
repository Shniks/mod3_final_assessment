class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def as_json(attrs={})
    {
      game_id: self.id,
      scores: [
               {
                user_id: self.plays.first[:user_id],
                score: self.plays.first[:score]
                },
                {
                user_id: self.plays.last[:user_id],
                score: self.plays.last[:score]
               }
              ]
    }
  end
end
