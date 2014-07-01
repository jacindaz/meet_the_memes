CarrierWave.configure do |config|

  #config.enable_processing = true
  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET']
    }
    config.fog_directory  = ENV['S3_BUCKET']
    config.storage = :fog
  else
    config.storage = :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
