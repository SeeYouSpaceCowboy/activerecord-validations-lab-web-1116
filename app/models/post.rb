class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 140 }
  validates :summary, length: { maximum: 140 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    if title && (title.include?("Won't Believe") || title.include?("Secret") ||title.include?("Top[number]") ||title.include?("Guess"))
      true
    else
      errors.add(:title, "is not clickbait")
    end
  end
end
