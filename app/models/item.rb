class Item < ApplicationRecord
  belongs_to :category

  has_attached_file :image, styles: { high: "840x600>", medium: "280x200>", thumb: "140x100>" },
    default_url: ":style/missing_item_image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def price_formatted
    self.price.to_s.reverse.gsub(/...(?=.)/,'\& ').reverse
  end

end
