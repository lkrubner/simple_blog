
namespace :simple do
  
  # call from command line:
  # rake simple:resize_images 
  
  desc "Resize images"
  task resize_images: :environment do
    
    Dir.foreach('storage') do |next_image|
      puts next_image
      next if next_image == '.' or next_image == '..'
      ResizeImage.perform_later next_image
    end
    
  end

end
