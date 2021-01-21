class Test < ApplicationRecord
  def self.from_category(category_name)
    joins("JOIN categories ON categories.id =tests.category_id")
      .where("categories: {name: category_name}).order(id: :desc).pluck(:name)
  end
end
