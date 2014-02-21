Paperclip::Attachment.default_options[:hash_secret] = ENV['PAPERCLIP_HASH_SECRET']

Paperclip.interpolates :imageable_class do |attachment, _|
  if attachment.instance.respond_to?(:imageable_type)
    attachment.instance.imageable_type.underscore.pluralize
  else
    'pages'
  end
end
