class Portfolio < ApplicationRecord
    include Rails.application.routes.url_helpers
    belongs_to :graphicker
    has_many_attached :avatars

    validates :title, presence: true
    validates :show, presence: true

    def avatars_url
        if avatars.attached? then
            avatar_list = []
            for avatar in avatars.attachments() do
                avatar_list.push(url_for(avatar.variant(resize: "512x362").processed))
            end
            return avatar_list
        end
        return nil
    end

    def avatar_url(avatar_index)
        avatars.attached? ? url_for(avatars[avatar_index].variant(resize: "512x362").processed) : nil
    end
end
