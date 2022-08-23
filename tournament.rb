require 'open-uri'

uris = %w[
  https://www.i-live-koeln.de/fileadmin/bilder/apartments/Komfort_1.jpg
  https://cf.bstatic.com/xdata/images/hotel/max1024x768/72282092.jpg?k=5eeba7eb191652ce0c0988b4c7c042f1165b7064d865b096bb48b8c48bf191b9&o=&hp=1
  https://media.adinahotels.com/media/filer_public_thumbnails/filer_public/c8/92/c892ac75-ec96-49ae-8030-f488c5956fd9/adina-apartment-hotel-auckland-britomart-three-bedroom-premier-apartment-lounge-room-01-2017-450x300.jpg__450x300_q85_subsampling-2.jpg
  https://www.residenz-am-zwinger.de/wp-content/uploads/2021/01/auswahl-2-zimmer-apartment.jpg
  https://www.apartment-s.at/tl_files/Bilder/Bildergalerie_6_2014/wae14_0062.jpg
  https://static.budgetplaces.com/establishment/55/86/28655/1.jpg
]


file = URI.open(url)
flat = Flat.new(title: , address: )
flat.photo.attach(io: file, filename: "image-#{i}", content_type: 'image/png')
flat.save
