class ResizeImage < ActiveJob::Base
  # Set the Queue as Default
  queue_as :default 

  # example url: http://images6.fanpop.com/image/photos/36800000/Best-Friends-kittens-36858183-1280-1024.jpg
  # ResizeImage.perform_later "http://images6.fanpop.com/image/photos/36800000/Best-Friends-kittens-36858183-1280-1024.jpg"
  def perform(img_url)
    # Open the image into memory
    image = MiniMagick::Image.open(img_url)

    # Change the image size
    image.resize "100x100"

    # Write the resulting image
    image.write output_path(img_url)
  end
end