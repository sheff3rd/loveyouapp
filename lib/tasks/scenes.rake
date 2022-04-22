namespace :scenes do
  desc "Generate all of the scenes"
  task generate: :environment do
    Scene.destroy_all

    Scene.create!(
      title: "Love you reminder!",
      description: "Reminds you how much I love you",
      slug: "love-you-so-much",
      thumbnail: {
        io: File.open("#{Rails.root}/public/images/heart-thumbnail.jpeg"),
        filename: "love-you-so-much.jpeg",
        content_type: "image/jpeg"
      }
    )

    Scene.create!(
      title: "Киця-кицюня",
      description: "У маленькій у хатині на тепленькій кожушині, Хтось дрімає хтось муркоче спозаранку спатки хоче.",
      slug: "kitty-cat",
      thumbnail: {
        io: File.open("#{Rails.root}/public/images/kitty-cat.jpeg"),
        filename: "kitty-cat.jpeg",
        content_type: "image/jped"
      },
      soundtrack: {
        io: File.open("#{Rails.root}/public/sounds/kitty.mp3"),
        filename: "kitty.mp3",
        content_type: "audio/mpeg"
      }
    )
  end
end
