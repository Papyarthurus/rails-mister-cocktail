module ApplicationHelper
  def photo_url_for(cocktail)
    if cocktail.photo.present?
      cl_image_path cocktail.photo, height: 300, width: 400, crop: :fill
    else
      'http://www.prevention.com/sites/prevention.com/files/styles/article_main_image_2200px/public/images/news/featured_images/cocktails-628x363-TS-133883027.jpg?itok=X7Y2yAu3'
    end
  end

  def show_photo(cocktail)
    image_tag(photo_url_for(cocktail))
  end
end
