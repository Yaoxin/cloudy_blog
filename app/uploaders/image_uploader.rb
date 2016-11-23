class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit =>[1200, nil]

  version :medium do
    process :resize_to_limit => [640,nil]
  end

  version :small do
    process :resize_to_limit => [400,nil]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # def filename
  #   if super.present?
  #     @prefix ||= SecureRandom.uuid.gsub("-","")
  #     "#{@prefix}.#{file.extension.downcase}"
  #   end
  # end
end
