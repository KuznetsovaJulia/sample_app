class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  version :thumb do
    process resize_to_limit: [30, 30]
  end
  def default_url
    "/uploads/user/avatar/1/" + [version_name, "default.png"].compact.join('_')
  end
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


end
