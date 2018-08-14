#fill me out. create one new user, post and tag

User.create(first_name: 'ashley', last_name: 'simone', password: '1234', username: 'heymssimone', email: 'asimone@gmail.com', birthday: '1990-03-11', photo_url: 'https://i.ytimg.com/vi/GtHEFawysgs/maxresdefault.jpg')

Post.create(user_id: 1, title: "WTH is a duvet cover?", user_id: 1, post_content: "Good news! I just signed my first lease which means I have to get all new furniture etc. Today I want to Bed Bath and Beyond only to be severly confused by the many options in the bedding section. After walking around aimlessly without much of an internet connection, I decided to go home and do some more research. Did you know that a duvet cover is just the sheet that goes over the comforter like a pillowcase?! Why don't they just call it a comfortercase??!!. Oh well, hopefully my experience can help you. In closing, a duvet cover is to a comforter what a pillowcase is to a pillow. Happy Adulting!", photo_url: "https://images.urbanoutfitters.com/is/image/UrbanOutfitters/38452751_018_b?$xlarge$&hei=900&qlt=80&fit=constrain")

