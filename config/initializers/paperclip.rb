Paperclip::Attachment.default_options[:hash_secret] = ENV['PAPERCLIP_HASH_SECRET']

Paperclip.interpolates :imageable_class do |attachment, _|
  attachment.instance.imageable_type.underscore.pluralize
end
