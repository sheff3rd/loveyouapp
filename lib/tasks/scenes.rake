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
      title: "Three Dimensional Scene",
      description: "Three js test scene",
      slug: "three-dimensional",
      thumbnail: {
        io: File.open("#{Rails.root}/public/images/three-dimensional.png"),
        filename: "three-dimensional.png",
        content_type: "image/png"
      }
    )
  end
end
