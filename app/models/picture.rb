class Picture < ApplicationRecord
    has_attached_file :image, styles: { small: "20x20>", medium: "300x300>", thumb: "100x100>" }, path: ":rails_root/public/images/:filename",
                            url: "/images/:filename"
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
end
