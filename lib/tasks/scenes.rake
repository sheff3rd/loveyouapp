namespace :scenes do
  desc "Generate all of the scenes"
  task generate: :environment do
    Scene.destroy_all

    Scene.create!(
      title: "Love you reminder!",
      description: "Reminds you how much I love you",
      slug: "love-you-so-much",
      thumbnail: {
        io: File.open("#{Rails.root}/tmp/images/heart-thumbnail.jpeg"),
        filename: "love-you-so-much.jpeg",
        content_type: "image/jpeg"
      }
    )
  end
end
