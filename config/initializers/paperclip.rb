Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:imageable_class/:class/:style/:hash.:extension'
Paperclip::Attachment.default_options[:hash_secret] = ENV['PAPERCLIP_HASH_SECRET']

Paperclip.interpolates :imageable_class do |attachment, _|
  attachment.instance.imageable_type.underscore.pluralize
end
