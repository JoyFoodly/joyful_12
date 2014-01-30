Paperclip::Attachment.default_options[:s3_host_name] = ENV['S3_HOST_NAME']
Paperclip::Attachment.default_options[:url] = '/:imageable_class/:class/:style/:hash.:extension'
Paperclip::Attachment.default_options[:hash_secret] = ENV['PAPERCLIP_HASH_SECRET']

Paperclip.interpolates :imageable_class do |attachment, _|
  attachment.instance.imageable_type.underscore.pluralize
end
