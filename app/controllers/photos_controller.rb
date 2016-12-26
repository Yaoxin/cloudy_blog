class PhotosController < ApplicationController
  def create
    @photo = Photo.new(image: params["Filedata"])
    @photo.save!
    render plain: @photo.image.medium.url
  end

  private
    def md_url(url)
      "![](#{url})"
    end
end
