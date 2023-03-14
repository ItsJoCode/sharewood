module StarRatingHelper

  def average_rating(product)
    review = Review.joins(order: { sale: :product }).where(products: { id: product.id })
    if review.blank?
      "aucune note"
    else
      review.average(:rating).round(1)
    end
  end

end
