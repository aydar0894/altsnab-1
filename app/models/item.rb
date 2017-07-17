class Item < ApplicationRecord
  belongs_to :category
  has_many :subitems_for_category
  has_many :selected_subitems
  accepts_nested_attributes_for :selected_subitems, reject_if: :all_blank, allow_destroy: true

  has_attached_file :image, styles: { high: "840x600>", medium: "280x200>", thumb: "140x100>" },
    default_url: ":style/missing_item_image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def price_formatted
    self.price.to_s.reverse.gsub(/...(?=.)/,'\& ').reverse
  end

  def fixed_length_description
    if self.description&.length > 60
      return self.description[0..60] + '..'
    else
      return self.description
    end
  end

  def selected_subitems
    Subitem.none
  end

  def subitems_for_category
    # @subitems = []
    # @subitem_items = SubitemItemCategory.where(category_id: self.category_id)

    # @subitem_items.each do |s|
    #   @subitems.push(Subitem.find(s.subitem_id))
    # end

    Subitem.joins("INNER JOIN subitem_item_categories ON subitems.id = subitem_item_categories.subitem_id").where(subitem_item_categories: {category_id: self.category_id})
  end

end
