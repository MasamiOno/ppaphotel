class Room < ApplicationRecord
    
    has_many :created_notes, class_name: 'Note'
    has_many :created_alerts, class_name: 'Alert'
    
    mount_uploader :frame01, Frame01Uploader
    mount_uploader :frame02, Frame02Uploader
    mount_uploader :frame03, Frame03Uploader
    mount_uploader :frame04, Frame04Uploader
    mount_uploader :frame05, Frame05Uploader
    mount_uploader :frame06, Frame06Uploader
    mount_uploader :frame07, Frame07Uploader
    mount_uploader :frame08, Frame08Uploader
    mount_uploader :frame09, Frame09Uploader
    mount_uploader :frame10, Frame10Uploader
    mount_uploader :roomface, RoomfaceUploader
    
    validates :petname,length: { maximum:200 }
    validates :rentcomment,length: { maximum:400 }
    validates :frm01comment,length: { maximum:200 }
    validates :frm02comment,length: { maximum:200 }
    validates :frm03comment,length: { maximum:200 }
    validates :frm04comment,length: { maximum:200 }
    validates :frm05comment,length: { maximum:200 }
    
end
