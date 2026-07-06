class Message < ApplicationRecord
  belongs_to :chat
  has_one_attached :attachment

  ALLOWED_ATTACHMENT_TYPES = ["image/jpeg", "application/pdf"]
  MAX_ATTACHMENT_SIZE = 10.megabytes

  validate :attachment_type_and_size, if: -> { attachment.attached? }

  private

  def attachment_type_and_size
    unless attachment.content_type.in?(ALLOWED_ATTACHMENT_TYPES)
      errors.add(:attachment, "must be a JPG or PDF file")
    end

    if attachment.byte_size > MAX_ATTACHMENT_SIZE
      errors.add(:attachment, "must be smaller than 10MB")
    end
  end
end
