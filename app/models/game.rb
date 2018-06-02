class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def as_json(attrs={})
    {
      game_id: self.id,
      scores: [
               {
                user_id: self.player_1.id,
                score: self.player_1.plays.sum(:score)
                },
                {
                user_id: self.player_2.id,
                score: self.player_2.plays.sum(:score)
               }
              ]
    }
  end
end
