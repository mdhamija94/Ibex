require 'open-uri'


Sneaker.destroy_all
Listing.destroy_all

Sneaker.connection.execute('ALTER SEQUENCE sneakers_id_seq RESTART WITH 1')

# Main arrays used to attribute sizes to listings in Listing Factory Methods
main_size_run = [ 8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0 ]
full_size_run = [ 4.0, 5.0, 6.0, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0, 13.0, 14.0 ]

# Returns an array of n random sizes that can be used to generate Listings
def size_limiter(sizes, n)
  res = []

  until res.length == n do
    sampled = sizes.sample

    if res.include?(sampled)
      next
    else
      res.push(sampled)
    end
  end

  return res.sort!
end

# Returns a mod 5 number to be used as a price for Listings
def price_setter(min, max)
  price_range = []
  (min..max).step(5) { |x| price_range.push(x) }
  return price_range.sample
end

# Jordan 1

  # Array of Sneaker Objects
  jordan_1s = [
    {
      name: "Air Jordan 1 Retro High OG 'Banned' 2016",
      description: "Banned by the NBA in 1985, Michael Jordan was charged $5,000 per game for wearing the Air Jordan 1 ‘Black/Red' because they didn’t include the color white which was part of the Chicago Bulls’ official team colors. Used as a marketing tactic, Nike crafted the ‘Banned’ campaign around the sneakers to launch and promote the Air Jordan line. The sneaker was retroed in 1994, 2011, 2013 and 2016. The 2011 pair featured an ‘X’ on the heel paying homage to the 'Banned' nickname.",
      sku: "555088 001",
      release_date: "03/09/2016",
      colorway: "Black/Varsity Red-White",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'Royal' 2017",
      description: "In 1985 sports photographer, Chuck Kohn, photographed Michael Jordan wearing the Air Jordan 1 Royals. This photo turned Nike poster was the first time anyone saw Michael wearing the Air Jordan 1 sneakers. Ever. Known to be his favorite colorway, Jordan chose the Royals to be the first Air Jordan 1 available for purchase. They were also the only color-way out of the Top 3 Air Jordan 1 Retro colorways (‘Banned’ and ‘Chicago’) that he never wore on the court. Since 1985, the Royals have been released in 2001, 2013, and 2017.",
      sku: "555088 007",
      release_date: "01/04/2017",
      colorway: "Black/Royal Blue-White",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'Shadow' 2018",
      description: "This Nike Air Jordan 1 Retro High OG 'Shadow' 2018 is a retro re-release of an original 1985 colorway. The shoe features a black and medium grey leather upper with a white midsole and black outsole. It also features OG Nike Air branding on the tongue and the Wings logo on the ankle collar. It was last retroed in 2013, and a low-top version dropped in 2015.",
      sku: "555088 013",
      release_date: "14/04/2018",
      colorway: "Black/Medium Grey-White",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'Chicago' 2015",
      description: "The Air Jordan 1 Retro High OG 'Chicago' 2015 colorway was designed to avoid Jordan's $5,000-per game fines from the NBA after the original black and red colorway was banned. The 'Chicago' was first retroed in 1994 and stayed true to the 1985 design. Further retros were released in 2013 with small changes to the design, and again in 2015 with the original branding details: the Nike Air logo on the tongue and the original clean heel without the Jumpman logo.",
      sku: "555088 101",
      release_date: "30/05/2015",
      colorway: "White/Varsity Red-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'UNC'",
      description: "Released in 1985, this Air Jordan 1 Retro High OG 'UNC' was retroed as part of the Jordan Brand’s Holiday 2015 retro pack. Featuring a blue and white colorway, this retro calls back to Jordan’s college days at the University of North Carolina where he won the 1982 NCAA National Championship as a freshman. The shoe features classic branding details like the Nike Air logo on the tongue, the Air Jordan ‘Wings’ logo, and a clean heel. The Jordan Brand Holiday 2015 pack also included the Air Jordan 8 Retro ‘Aqua’, Air Jordan 8 Retro ‘Chrome’, Air Jordan 8 Retro ‘Threepeat’, Air Jordan 7 Retro ‘Sweater’, and Air Jordan 14 Retro Low ‘Laney’.",
      sku: "555088 117",
      release_date: "10/10/2015",
      colorway: "White/Dark Powder Blue",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'Black Toe' 2016",
      description: "One of the original colorways of the Air Jordan 1 line, the Air Jordan 1 Retro BG 'Black Toe' grew in popularity after being featured in several Nike promotional campaigns (including the photo that inspired the Jordan logo itself). Surprisingly though, Jordan only wore this colorway in a handful of games, thereby increasing its popularity. Retroed in 2013, the 2016 release returns to the original 1985 branding with the Nike Air logo on the tongue and the absence of the Jumpman logo on the heel.",
      sku: "555088 125",
      release_date: "05/11/2015",
      colorway: "Black/White-Varsity Red",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'Rookie of the Year'",
      description: "In 1985, Michael Jordan received the NBA’s Rookie of the Year Award after launching his career with a remarkable point per game average and a thirst for success. To celebrate, Jordan Brand released the Air Jordan 1 Retro High OG 'Rookie of the Year.' The high top features a white-based leather upper with perforations on the toe box for breathability and Gold Harvest leather overlays on the mudguard, ankle, eyestay, and heel. Hidden on the inside of each strap on the upper are callouts to MJ’s outstanding rookie season. ‘1984-85 R.O.Y. 2313 POINTS 28.2 PPG’ can be found on the inside of one strap, and a quote from Jordan can be found on the other.",
      sku: "555088 700",
      release_date: "17/11/2018",
      colorway: "Gold Harvest/Black-Sail",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'Game Royal'",
      description: "With color blocking that mirrors the original “Chicago”, the Air Jordan 1 Retro High introduces another addition to the AJ1 family: ‘Game Royal’ blue. A little jarring at first, the Game Royal settles in nicely with the original 1985 color block with a new updated shade of blue. The Wings logo and Swoosh are punctuated in black, with the Summit White on the side panel and toebox.",
      sku: "555088 403",
      release_date: "24/03/2018",
      colorway: "Game Royal/Summit White-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'Bred Toe'",
      description: "Arriving in stores in February 2018, the Air Jordan 1 Retro High OG ‘Bred Toe’ is a new spin on a classic design. The Chicago Bulls-inspired colorway combines elements of the ‘Bred’ and ‘Black Toe’ editions of the Air Jordan 1, executed on a premium leather build. The high-top features a black Swoosh on the white quarter panel, along with contrasting pops of red on the toe box, heel, collar, and outsole. The shoe stays true to its OG 1985 roots with Nike Air branding on the tongue tag and sockliner.",
      sku: "555088 610",
      release_date: "24/02/2018",
      colorway: "Gym Red/Summit White-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {   
      name: "Air Jordan 1 Retro High OG 'Obsidian'",
      description: "The Air Jordan 1 Retro High OG is a work of nostalgia, modernizing the 1985 icon's distinctive elements to honor Michael Jordan's legendary career arc. Debuted in August 2017, this 'Obsidian' version tributes MJ's college alma mater through a team-inspired, color block palette on the leather upper. Matching branding notes and Swooshes play their part in the homage. The Nike Air infused midsole and circular rubber outsole supply classic comfort and traction.",
      sku: "555088 140",
      release_date: "31/08/2019",
      colorway: "Sail/Obsidian-University Blue",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG NRG 'Gold Toe'",
      description: "The Air Jordan 1 Retro High OG NRG 'Gold Toe' features a black patent leather upper with distinctive metallic gold accents on the perforated toe box, tongue branding, and the heel panel. The high top also boasts a white side panel which extends from the midfoot to the heel, and a white rubber midsole. Other details include suede accents on the lacing structure, large Swoosh branding, and a tonal black outsole.",
      sku: "861428 007",
      release_date: "16/02/2018",
      colorway: "Black/Black-Metallic Gold-White",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'Pine Green'",
      description: "The Air Jordan 1 Retro High OG ‘Pine Green’ showcases a modified take on the silhouette’s classic ‘Black Toe’ design, first introduced to the world in 1985. The leather high-top employs a black and white color scheme with Pine Green accents on the heel, outsole and leather wings that wrap around the collar. Unlike the original ‘Black Toe,’ the traditional white finish on the toe box is colored in with more Pine Green.",
      sku: "555088 302",
      release_date: "22/09/2018",
      colorway: "Black/Varsity Red-White",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'Court Purple'",
      description: "The Air Jordan 1 Retro High OG ‘Court Purple’ features an all-leather build, executed with the same color-blocking seen on AJ1 models like the ‘Shattered Backboard’ and ‘Bred Toe.’ Here, the toe box, heel and wings are finished in Court Purple, while a crisp white quarter panel is overlaid with a contrasting black Swoosh. The shoe earns its ‘OG’ designation through the purple Nike tag on the black nylon tongue.",
      sku: "555088 501",
      release_date: "22/09/2018",
      colorway: "Court Purple/Sail-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Air Jordan 1 Retro High OG 'Shattered Backboard'",
      description: "In 1985 on a Nike Europe tour, Michael Jordan shattered a backboard when throwing down a monstrous dunk while wearing an orange, black, and white uniform. Commemorating the moment and uniform, this 2015 Air Jordan 1 'Shattered Backboard' (aka 'Shattered Backboard' 1.0) sneaker was released. Shortly after in the Fall of 2016, an Air Jordan 1 'Shattered Backboard Away' (aka 'Reverse' and 'Shattered Backboard 2.0') was released. The sneaker keeps the black laces and Nike branding, but swaps out the orange toe box and black around the toe and tongue for white.",
      sku: "555088 005",
      release_date: "27/06/2015",
      colorway: "Black/Starfish-Sail",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Union x Air Jordan 1 Retro High 'Black Toe'",
      description: "The Union x Air Jordan 1 Retro High 'Black Toe' sees the venerable Los Angeles retailer take inspiration from thrifting and DIY culture to create a new take on the sneaker that started it all. In addition to a pre-yellowed midsole for a vintage aesthetic, a mismatched collar is attached to the rest of the upper with zigzag stitching that gives the impression of a makeshift design.",
      sku: "BV1300 106",
      release_date: "17/11/2018",
      colorway: "White/Black-Varsity Red-Wolf Grey",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Union x Air Jordan 1 Retro High 'Storm Blue'",
      description: "The design of Union x Air Jordan 1 Retro High ‘Storm Blue’ is meant to evoke the look and feel of ‘your old favorite pair of shoes.’ Consequently, the white midsole is treated to pre-yellowing, while the white and blue leather upper is topped with the collar of a red and black Air Jordan 1 colorway. The latter is grafted onto the shoe with zigzag yellow stitching for a DIY look and feel.",
      sku: "BV1300 146",
      release_date: "17/11/2018",
      colorway: "White/Storm Blue-Varsity Red-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Fragment Design x Air Jordan 1 Retro High OG",
      description: "The Nike Fragment Design x Air Jordan 1 Retro High OG is the first collaboration between Hiroshi Fujiwara's Fragment Design and Brand Jordan. One of the most coveted Air Jordan 1 colorways ever created, the design combines the OG black-toe color blocking with royal blue accents. Released in limited quantities in December 2014, the design also includes Nike Air branding on the tongue and a Fragment Design logo at the heel.",
      sku: "716371 040",
      release_date: "27/12/2014",
      colorway: "Black/Sport Royal-White",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
        {
      name: "Travis Scott x Air Jordan 1 Retro High OG 'Mocha'",
      description: "The Travis Scott x Air Jordan 1 Retro High features a new look on the iconic silhouette, thanks to an oversized backward-facing Swoosh on the lateral side. A traditionally oriented Swoosh graces the medial side of the upper, which is built with a blend of white leather and brown suede. Additional unique details include a double-layer construction on the collar and Scott’s crudely drawn face logo embossed on the heel.",
      sku: "CD4487 100",
      release_date: "11/05/2019",
      colorway: "Sail/Dark Mocha-University Red-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Travis Scott"
    },
    {
      name: "Travis Scott x Air Jordan 1 Low 'Mocha'",
      description: "Travis Scott and Jordan Brand collaborate on an Air Jordan 1 Low, taking similar design cues from the high-top version. An oversized backward facing Swoosh is featured prominently on the lateral side of the shoe, while a regular Swoosh graces the medial side. Black and Dark Mocha nubuck dominate the upper, with a few pops of University Red adding a nice contrast. Travis Scott details are subtly placed on the shoe, with the ‘Cactus Jack’ logo appearing on the tongue, medial side panel and sockliner. The back heel tabs feature intricately stitched logos, with the Air Jordan Wings on the right shoe and Scott’s crudely drawn face on the left shoe.",
      sku: "CQ4277 001",
      release_date: "20/07/2019",
      colorway: "Black/Dark Mocha-University Red-Sail",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Travis Scott"
    },
    {
      name: "Eric Koston x Air Jordan 1 Low SB 'Powder Blue'",
      description: "The Eric Koston x Air Jordan 1 Low SB 'Powder Blue' represents a silhouette that Koston missed out on as a kid, but got to help design and eventually wear as a sponsored Nike SB athlete. The low-cut shoe was first seen on the foot of Koston and released in August 2019. It has a white-based leather upper with Dark Powder Blue detailing, Nike Swoosh and overlays. Finishing the style is the classic Wings logo on the heel, and Koston's signature on the inside tongue label.",
      sku: "CJ7891 401",
      release_date: "10/08/2019",
      colorway: "Dark Powder Blue/White",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    },
    {
      name: "Eric Koston x Air Jordan 1 Low SB 'Midnight Navy'",
      description: "Designed in collaboration with skate legend Eric Koston, this Air Jordan 1 Low gets the Nike SB treatment. The colorway is inspired by a similar AJ1 that dropped in 2001: a Mid-Top version and a Japan-exclusive High-Top version. This 'Midnight Navy' tribute—debuted in June 2019—reworks the icon with suede paneling and Metallic Silver Swooshes. A bright Jumpman logo on the toe box is a nice subtle detail, along with the Zoom Air sockliner for impact protection.",
      sku: "CJ7891 400",
      release_date: "17/06/2019",
      colorway: "Midnight Navy/White-Metallic Silver",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
    }
  ]

  # Sneaker Factory Method
  jordan_1s.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  jordan_1s.each do |sneaker|
    case sneaker[:name]
    when "Air Jordan 1 Retro High OG 'Banned' 2016"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(400, 700) })
      end
    when "Air Jordan 1 Retro High OG 'Royal' 2017"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(250, 450) })
      end
    when "Air Jordan 1 Retro High OG 'Shadow' 2018"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(250, 400) })
      end
    when "Air Jordan 1 Retro High OG 'Chicago' 2015"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(700, 950) })
      end
    when "Air Jordan 1 Retro High OG 'Obsidian'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(225, 400) })
      end
    when "Air Jordan 1 Retro High OG 'Bred Toe'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(350, 650) })
      end
    when "Air Jordan 1 Retro High OG 'Rookie of the Year'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(225, 400) })
      end
    when "Air Jordan 1 Retro High OG NRG 'Gold Toe'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(350, 500) })
      end
    when "Eric Koston x Air Jordan 1 Low SB 'Powder Blue'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(180, 300) })
      end
    when "Travis Scott x Air Jordan 1 Low 'Mocha'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(650, 1100) })
      end
    when "Travis Scott x Air Jordan 1 Retro High OG 'Mocha'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1000, 2250) })
      end
    when "Air Jordan 1 Retro High OG 'Pine Green'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(300, 450) })
      end
    when "Air Jordan 1 Retro High OG 'Game Royal'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(300, 500) })
      end
    when "Air Jordan 1 Retro High OG 'Court Purple'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(400, 600) })
      end
    when "Air Jordan 1 Retro High OG 'UNC'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(450, 700) })
      end
    when "Air Jordan 1 Retro High OG 'Shattered Backboard'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(700, 1200) })
      end
    when "Air Jordan 1 Retro High OG 'Black Toe' 2016"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(450, 750) })
      end
    when "Eric Koston x Air Jordan 1 Low SB 'Midnight Navy'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(180, 250) })
      end
    when "Union x Air Jordan 1 Retro High 'Black Toe'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1000, 2000) })
      end
    when "Union x Air Jordan 1 Retro High 'Storm Blue'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(900, 1650) })
      end
    when "Fragment Design x Air Jordan 1 Retro High OG"
      size_limiter(main_size_run, 4).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(2150, 2750) })
      end
    end
  end

# Yeezy 350

  # Array of Sneaker Objects
  yeezy_350s = [
    {
      name: "Yeezy Boost 350 'Turtle Dove'",
      description: "First seen on Kanye and his models at the Yeezy Season 1 fashion show in February 2015, the Yeezy Boost 350 ‘Turtle Dove’ was the second shoe released in the adidas Yeezy collection after the Yeezy Boost 750 ‘OG.’ Dropped on June 27, 2015, the ‘Turtle Dove’ sold out instantly online and was eventually anointed 2015’s Shoe of the Year at the Footwear News 29th Annual Achievement Awards.",
      sku: "AQ4832",
      release_date: "27/06/2014",
      colorway: "Turtle Dove/Blue Grey/Core White",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 'Pirate Black'",
      description: "Released on August 22nd, 2015, the Yeezy Boost 350 ‘Pirate Black’ features a pirate black/dark gray Primeknit upper with branded suede patches on the medial sides, patterned dark grey rope laces, red accented heel tabs, and a black Boost outsole.",
      sku: "AQ2659",
      release_date: "22/08/2015",
      colorway: "Pirate Black",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 'Moonrock'",
      description: "Following the ‘Turtle Dove’ and ‘Pirate’ colorways, the Yeezy Boost 350 ‘Moonrock’ features a moonrock/agate grey Primeknit upper and a moonrock Boost outsole. First previewed on Instagram by Kim Kardashian and released on November 14th, 2015, the Yeezy Boost 350 ‘Moon Rock’ was sold exclusively at stores that carried Yeezy Season One apparel.",
      sku: "AQ2660",
      release_date: "14/11/2015",
      colorway: "Agate Grey/Moonrock",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 'Oxford Tan'",
      description: "The adidas Yeezy Boost 350 ‘Oxford Tan’ features an oxford/light stone Primeknit upper with tonal oxford laces, suede patches on the medial sides, and a tan Boost outsole. First worn by Kanye at the August 2015 MTV VMAs, the fourth colorway of the Yeezy 350 was released at select adidas Originals Retail stores on December 29th, 2015.",
      sku: "AQ2661",
      release_date: "29/12/2015",
      colorway: "Light Stone/Oxford Tan",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Beluga'",
      description: "Unveiled at the Yeezy Season 3 presentation at Madison Square Garden, the Yeezy Boost 350 V2 ‘Beluga’ dropped on September 24, 2016. The evolved Yeezy Boost 350 V2 silhouette features a two-tone grey Primeknit and a solar red stripe with SPLY-350 branding on the lateral side. On the medial side, the suede midfoot panel has been removed and the pull tab replaced with a new elastic fit.",
      sku: "BB1826",
      release_date: "24/09/2016",
      colorway: "Steel Grey/Beluga/Solar Red",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Green'",
      description: "Released on November 23, 2016, in a three-pack alongside the ‘Copper’ and ‘Red,’ the Yeezy Boost 350 V2 ‘Green’ combines a black Primeknit upper with a green stripe, SPLY 350 branding, and a translucent black midsole housing full-length Boost.",
      sku: "BY9611",
      release_date: "23/11/2016",
      colorway: "Core Black/Green/Core Black",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Red'",
      description: "Released on November 23, 2016, in a three-pack alongside the ‘Green’ and ‘Copper’ colorways, the Yeezy Boost 350 V2 ‘Red’ combines a black Primeknit upper with a Red stripe, SPLY 350 branding, and a translucent black midsole housing full-length Boost.",
      sku: "BY9612",
      release_date: "23/11/2016",
      colorway: "Core Black/Solar Red/Core Black",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Copper'",
      description: "Released on November 23, 2016, in a three-pack alongside the ‘Green’ and ‘Red’ colorways, the Yeezy Boost 350 V2 Copper’ combines a black Primeknit upper with a Copper stripe, SPLY 350 branding, and a translucent black midsole housing full-length Boost.",
      sku: "BY1605",
      release_date: "23/11/2016",
      colorway: "Core Black/Copper/Core Black",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
  
    {
      name: "Yeezy Boost 350 V2 'Oreo'",
      description: "Released on December 17, 2016, the Yeezy Boost 350 V2 ‘Oreo’ features a black Primeknit upper with a white stripe, SPLY 350 branding, and a translucent black midsole housing full-length Boost.",
      sku: "BY1604",
      release_date: "17/12/2016",
      colorway: "Core Black/Core White/Core Black",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Bred'",
      description: "First released on February 11, 2017, the Yeezy Boost 350 V2 ‘Bred’ combines a black Primeknit upper with red SPLY 350 branding, and a translucent black midsole housing full-length Boost. This colorway of Yeezy Boost 350 V2 remains one of the most coveted Yeezy's in existence.",
      sku: "CP9652",
      release_date: "11/02/2017",
      colorway: "CORE BLACK/CORE BLACK/RED",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Zebra'",
      description: "Released on February 25, 2017, the Yeezy Boost 350 V2 ‘Zebra’ combines a white/core black Primeknit upper with red SPLY 350 branding and a translucent white midsole housing full-length Boost. Sold exclusively at adidas.com, Yeezy Supply, and select adidas flagship stores, the ‘Zebra’ sold out instantly but was restocked on June 24th, 2017. Another restock of the ‘Zebra’ arrived November 16, 2018, with more pairs hitting the marketplace and delivering on Kanye’s promise of Yeezy’s being more accessible to anyone that wanted them.",
      sku: "CP9654",
      release_date: "25/02/2017",
      colorway: "White/Core Black/Red",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Cream'",
      description: "First released on April 29, 2017, the Yeezy Boost 350 V2 ‘Cream White’ combines a cream Primeknit upper with tonal cream SPLY 350 branding, and a translucent white midsole housing full-length Boost. Released again in October 2018, this retro helped fulfill Kanye West’s oft-repeated ‘YEEZYs for everyone’ Twitter mantra, as adidas organized the biggest drop in Yeezy history by promising pre-sale to anyone who signed up on the website. Similar to the first release, the ‘Triple White’ 2018 model features a Primeknit upper, a Boost midsole and custom adidas and Yeezy co-branding on the insole.",
      sku: "CP9366",
      release_date: "29/04/2017",
      colorway: "Cream White/Core White",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Blue Tint'",
      description: "The 5th Yeezy to drop since November 2017 — Yeezy Boost 350 V2 'Semi Frozen Yellow' and ‘Beluga 2.0,’ Yeezy Powerphase Calabasas, and the Yeezy 500 ‘Desert Rat’ — the Yeezy Boost 350 V2 'Blue Tint' was dropped on December 16th, 2017. The sneaker features a neutral white and grey upper with a red ‘SPLY-350’ text on the side in reverse. The shoe also comes with a heel tab, blue tint inner lining, and paste blue laces.",
      sku: "B37571",
      release_date: "16/12/2017",
      colorway: "Blue Tint/Grey Three/High Res Red",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Beluga 2.0'",
      description: "With its name coming from the colorway similarities found on the first Yeezy Boost 350 V2, the Yeezy Boost 350 V2 'Beluga 2.0' dropped on November 25, 2017. It was quickly restocked on November 30th after selling out. The shoe features a muted grey stripe on the laterals instead of the bright orange stripe found on the original ‘Beluga’ sneaker. The Yeezy Boost 350 V2 'Beluga 2.0' also features a heel pull tab with orange stitching and orange ‘SPLY-350’ lettering in reverse on the laterals.",
      sku: "AH2203",
      release_date: "25/11/2017",
      colorway: "Grey/Bold Orange/Dark Solid Grey",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Semi-Frozen Yellow'",
      description: "Kanye West’s Yeezy Boost 350 V2 in Semi Frozen Yellow first hit stores in November 2017, with a restock that released on December 14, 2018. Dressed in adidas’ signature Primeknit upper, the lifestyle runner is finished in an energetic bright yellow hue, one that extends to the laces, heel tab, and Boost-infused ribbed rubber midsole. Zebra-like black stripes add another design dimension to the upper, along with a tonal side stripe emblazoned with ‘SPLY 350’ in reverse red print. A gum rubber outsole adds grippy traction to the eye-catching design.",
      sku: "B37572",
      release_date: "18/11/2017",
      colorway: "Semi Frozen Yellow/Raw Steel/Red",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Butter'",
      description: "Kanye West and adidas continued their partnership with the Yeezy Boost 350 V2 ‘Butter,’ which hit stores in June 2018. The minimalist silhouette features distinct center stitching on a reverse Primeknit upper, with the signature ‘SPLY-350’ inscription now printed on the interior side. The heel tab remains, finished in a bright yellow hue that matches the knitted upper, rope laces, and Boost-infused midsole.",
      sku: "F36980",
      release_date: "30/06/2018",
      colorway: "Butter/Butter/Butter",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Sesame'",
      description: "The Yeezy Boost 350 V2 ‘Sesame’ features a refined color palette that complements the shoe’s minimalist build. The breathable Primeknit upper keeps the heel tab and distinct center stitch detailing but loses the mirrored ‘SPLY-350’ branding. Underneath, a semi-translucent rubber midsole houses a full-length Boost cushioning, while a gum rubber outsole delivers enhanced traction.",
      sku: "F99710",
      release_date: "23/11/2018",
      colorway: "Sesame/Sesame/Sesame",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Static Non-Reflective'",
      description: "The Yeezy Boost 350 V2 ‘Static Non-Reflective’ is designed to stand out, thanks to the addition of never-before-seen features. They include a translucent side stripe and 3M reflective detailing on the shoe’s rope laces, Primeknit upper and Three-Stripes branding on the interior heel. The midsole makes use of ridged TPU sidewalls with semi-translucent properties, revealing full-length adidas Boost cushioning within.",
      sku: "EF2905",
      release_date: "27/12/2018",
      colorway: "Static/Static/Static",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Black Non-Reflective'",
      description: "The adidas Yeezy Boost 350 V2 lives up to its cult appeal through evolved design elements and advanced technology. Released June 2019, this ‘Black Non-Reflective' edition's re-engineered Primeknit bootie sees futuristic updates including a translucent side stripe and bold stitching on the heel pull. Integrated lacing customizes the fit while a translucent black Boost-equipped midsole complements the covert feel.",
      sku: "FU9006",
      release_date: "07/06/2019",
      colorway: "Black/Black/Black",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 350 V2 'Glow'",
      description: "Regarded as a cultural phenomenon, the adidas Yeezy Boost 350 silhouette generated a cult following when it was initially released in 2015. This ‘Glow’ makeover—released in May 2019—equips the Primeknit upper with a high-visibility treatment and a translucent stripe to the lateral profile. Integrated lacing and a coordinating heel pull provide easy on/off. Underfoot, the signature full-length Boost midsole looks to the future with a bright glow in the dark finish.",
      sku: "EG5293",
      release_date: "25/05/2019",
      colorway: "Glow/Glow/Glow",
      brand: "Adidas",
      silhouette: "Yeezy Boost 350 V2",
      technology: "Boost",
      designer: "Kanye West"
    }
  ]

  # Sneaker Factory Method
  yeezy_350s.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  yeezy_350s.each do |sneaker|
    case sneaker[:name]
    when "Yeezy Boost 350 'Turtle Dove'"
      [ 7.0, 9.0, 10.0, 13.0 ].each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(900, 1500) })
      end 
    when "Yeezy Boost 350 'Pirate Black'"
      size_limiter(full_size_run, 8).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(700, 1200) })
      end 
    when "Yeezy Boost 350 'Moon Rock'"
      size_limiter(full_size_run, 5).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(900, 1300) })
      end 
    when "Yeezy Boost 350 'Oxford Tan'"
      size_limiter(full_size_run, 6).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(800, 1100) })
      end 
    when "Yeezy Boost 350 V2 'Beluga'"
      size_limiter(full_size_run, 10).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(650, 1100) })
      end 
    when "Yeezy Boost 350 V2 'Green'"
      size_limiter(full_size_run, 12).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(500, 800) })
      end 
    when "Yeezy Boost 350 V2 'Red'"
      size_limiter(full_size_run, 7).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(700, 1100) })
      end 
    when "Yeezy Boost 350 V2 'Copper'"
      size_limiter(full_size_run, 10).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(550, 850) })
      end 
    when "Yeezy Boost 350 V2 'Oreo'"
      size_limiter(full_size_run, 14).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(700, 1000) })
      end 
    when "Yeezy Boost 350 V2 'Bred'"
      size_limiter(full_size_run, 9).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(650, 950) })
      end 
    when "Yeezy Boost 350 V2 'Cream'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(275, 350) })
      end 
    when "Yeezy Boost 350 V2 'Zebra'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(375, 500) })
      end 
    when "Yeezy Boost 350 V2 'Blue Tint'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(375, 500) })
      end 
    when "Yeezy Boost 350 V2 'Beluga 2.0'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(400, 600) })
      end 
    when "Yeezy Boost 350 V2 'Semi-Frozen Yellow'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(250, 400) })
      end 
    when "Yeezy Boost 350 V2 'Butter'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(250, 375) })
      end 
    when "Yeezy Boost 350 V2 'Sesame'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(300, 425) })
      end 
    when "Yeezy Boost 350 V2 'Static Non-Reflective'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(375, 600) })
      end 
    when "Yeezy Boost 350 V2 'Black Non-Reflective'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(400, 550) })
      end 
    when "Yeezy Boost 350 V2 'Glow'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(600, 800) })
      end
    end
  end


# Yeezy 750

  # Array of Sneaker Objects
  yeezy_750s = [
    {
      name: "Yeezy Boost 750 'OG'",
      description: "Kanye West’s very first collaborative adidas shoe, the Yeezy Boost 750 ‘OG’ released worldwide February 2015 in extremely limited quantities. The towering boot-like builds showcases a radical departure from West’s previous designs, featuring a light brown all-suede upper mounted atop a partially ribbed, Boost-equipped rubber tooling in a subtle off-white shade. The minimalist design is accented with oversized rope laces, perforated detailing on the toe box, and a wide midfoot strap in a tonal twill fabrication. A hidden zipper on the lateral side provides easy on and off.",
      sku: "B35309",
      release_date: "14/02/2014",
      colorway: "Light Grey/Carbon White",
      brand: "Adidas",
      silhouette: "Yeezy Boost 750",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 750 'Triple Black'",
      description: "Kanye teased the Yeezy Boost 750 ‘Black’ colorway in a February 2015 interview with New York’s Power 105.1 FM. Later he was spotted wearing a black suede/gum sole iteration of the sneaker at a Givenchy show during New York Fashion Week. Released on December 19, 2015, as the second colorway of the Yeezy Boost 750 line, the ‘Black’ sneaker features a full suede upper, perforated vamp, and ankle zipper.",
      sku: "BB1839",
      release_date: "19/12/2015",
      colorway: "Core Black/Core Black/Core Black",
      brand: "Adidas",
      silhouette: "Yeezy Boost 750",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 750 'Chocolate'",
      description: "First seen during Kanye’s Yeezy Season 2 presentation at New York Fashion Week, the Yeezy Boost 750 ‘Chocolate’ sneaker was officially released a month later on October 15, 2016. The design combines a light brown nubuck upper with an elasticated mid-foot strap, perforated vamp, and a gum Boost midsole that glows in the dark. The sneaker also features an upgraded YKK ankle zipper.",
      sku: "BY2456",
      release_date: "15/10/2016",
      colorway: "Light Brown/Light Brown/Gum",
      brand: "Adidas",
      silhouette: "Yeezy Boost 750",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 750 'Grey Gum'",
      description: "Released June 11, 2016, the Yeezy Boost 750 ‘Glow in the Dark’ features a light grey nubuck upper with elasticated mid-foot strap. It also comes with an ankle zipper, perforated vamp, and a glow in the dark translucent gum Boost midsole.",
      sku: "BB1840",
      release_date: "11/06/2016",
      colorway: "Light Grey/Light Grey/Gum",
      brand: "Adidas",
      silhouette: "Yeezy Boost 750",
      technology: "Boost",
      designer: "Kanye West"
    }
  ]

  # Sneaker Factory Method
  yeezy_750s.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  yeezy_750s.each do |sneaker|
    case sneaker[:name]
    when "Yeezy Boost 750 'OG'"
      [ 8.0, 10.0, 11.0, 12.0 ].each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1200, 1900) })
      end 
    when "Yeezy Boost 750 'Triple Black'",
      size_limiter(main_size_run, 6).each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(900, 1400) })
      end 
    when "Yeezy Boost 750 'Chocolate'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(650, 900) })
      end 
    when "Yeezy Boost 750 'Grey Gum'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(850, 1200) })
      end 
    end
  end

# Yeezy 700

  # Array of Sneaker Objects
  yeezy_700s = [
    {
      name: "Yeezy Boost 700 'Wave Runner'",
      description: "This inaugural colorway of Kanye West’s Yeezy Wave Runner 700 shock-dropped for pre-order in August of 2017, following a public debut earlier in the year as part of the Yeezy Season 5 runway show. The sneaker’s retro-inspired lines worked in tandem with a chunky silhouette reminiscent of an earlier era. A mesh base is finished in grey on the quarter panels and bright blue and teal on the forefoot. Suede overlays arrive on the toe and heel accented grey leather eyestays. Other details include neon green laces, a bulky white midsole, and pops of black and bright orange.",
      sku: "B75571",
      release_date: "12/08/2017",
      colorway: "Solid Grey/Chalk White/Core Black",
      brand: "Adidas",
      silhouette: "Yeezy Boost 700",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 700 'Mauve'",
      description: "The Yeezy Boost 700 ‘Mauve’ takes on a somber color scheme that blends black and purplish grey across its signature multi-layered upper. The complex arrangement sees different varieties of mesh complemented with suede and textured leather paneling, all resting upon a tonal sculpted midsole accented with pops of neon green. Exterior branding is limited to subtly visible Three-Stripes on the quarter panel and an adidas logo embossed on the outsole.",
      sku: "EE9614",
      release_date: "27/10/2018",
      colorway: "Mauve/Mauve/Mauve",
      brand: "Adidas",
      silhouette: "Yeezy Boost 700",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 700 V2 'Static'",
      description: "The Yeezy Boost 700 V2 ‘Static’ is an update to the original Wave Runner. The upper features a slightly reworked design, while the midsole stays the same. This new edition showcases an understated colorway made up of soft, neutral shades. The layered composition of the upper, featuring a mesh base with welded reflective overlays and leather paneling, is finished in varying shades of grey and white. The silhouette’s signature bulky midsole, finished in matching white, is supported underfoot by a black rubber outsole.",
      sku: "EF2829",
      release_date: "29/12/2018",
      colorway: "Static/Static/Static",
      brand: "Adidas",
      silhouette: "Yeezy Boost 700 V2",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 700 'Inertia'",
      description: "The adidas Yeezy Boost 700 ‘Inertia’ is part of the Yeezy Season 8 lineup that launched March 2019. The ‘Inertia’ colorway showcases the original 700 upper, with a heavily paneled construction made with premium suede, mesh and smooth leather sections. Cast primarily in cool grey tones, the sneaker includes hits of Tangerine for contrast. The shoe’s signature chunky midsole is equipped with full-length Boost cushioning for responsive comfort.",
      sku: "EG7597",
      release_date: "09/03/2019",
      colorway: "Inertia/Inertia/Inertia",
      brand: "Adidas",
      silhouette: "Yeezy Boost 700",
      technology: "Boost",
      designer: "Kanye West"
    },
    {
      name: "Yeezy Boost 700 V2 'Vanta'",
      description: "Seen as the successor to the first Yeezy 700 that debuted at Kanye West’s 2017 Yeezy Season 5 show, the Yeezy Boost 700 V2 sneaker maintains elements of the original while updating it with a sleeker profile. Released in June 2019, the 'Vanta' edition brings an all-over black hue to its multi-layered mesh upper with suede overlays. Below, full-length adidas Boost technology cushions the foot, encapsulated within the 700's distinct chunky sole.",
      sku: "FU6684",
      release_date: "06/06/2019",
      colorway: "Vanta/Vanta/Vanta",
      brand: "Adidas",
      silhouette: "Yeezy Boost 700 V2",
      technology: "Boost",
      designer: "Kanye West"
    }
  ]

  # Sneaker Factory Method
  yeezy_700s.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  yeezy_700s.each do |sneaker|
    case sneaker[:name]
    when "Yeezy Boost 700 'Wave Runner'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(375, 600) })
      end 
    when "Yeezy Boost 700 'Mauve'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(295, 350) })
      end 
    when "Yeezy Boost 700 V2 'Static'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(500, 700) })
      end 
    when "Yeezy Boost 700 'Inertia'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(275, 340) })
      end 
    when "Yeezy Boost 700 V2 'Vanta'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(300, 355) })
      end
    end
  end

# Air Yeezy

  # Array of Sneaker Objects
  air_yeezys = [
    {
      name: "Air Yeezy 'Zen'",
      description: "The Air Yeezy ‘Zen’ launched in April 2009, one of three colorways that made up the first collaborative release from Kanye West and Nike. An overall new silhouette with details borrowed from the Nike archives, the design employs a mostly neutral colorway with vibrantly hued accents throughout. The patent leather midfoot strap comes in a unique texture while the toe cap features premium suede. Underfoot, the nondescript rubber outsole glows green when the lights go down.",
      sku: "366164 002",
      release_date: "04/04/2009",
      colorway: "Zen Grey/Light Charcoal",
      brand: "Nike",
      silhouette: "Air Yeezy",
      technology: "Air",
      designer: "Kanye West" 
    },
    {
      name: "Air Yeezy 'Blink'",
      description: "The Air Yeezy ‘Blink’ from April 2009 is one of three sneakers that kicked off Kanye West’s partnership with Nike. The high-top blends a variety of materials and textures on the upper, finished in tonal black with a pop of bright pink on the lining, lace lock, and ‘Yeezy’ print on the heel loop. While the vamp features smooth suede construction, the midfoot strap and heel panel are covered in an all-over ‘Y’ print for an eye-catching texture.",
      sku: "366164 003",
      release_date: "02/05/2009",
      colorway: "Black/Black",
      brand: "Nike",
      silhouette: "Air Yeezy",
      technology: "Air",
      designer: "Kanye West" 
    },
    {
      name: "Air Yeezy 'Net'",
      description: "The Air Yeezy ‘Net’ launched in June 2009 and would be the third and final colorway of the debut sneaker from Kanye West and Nike to hit stores. The shoe features a beige leather upper stopping at a high collar lined in pink, mounted on a two-tone midsole borrowed from the Nike Air Jordan 3. The smooth and glossy finish on the patent leather midfoot strap is contrasted by a perforated leather vamp and suede toe wrap, embossed with an all-over ‘Y’ print.",
      sku: "366164 111",
      release_date: "01/06/2009",
      colorway: "Net/Net",
      brand: "Nike",
      silhouette: "Air Yeezy",
      technology: "Air",
      designer: "Kanye West" 
    },  
    {
      name: "Air Yeezy 2 NRG 'Solar Red'",
      description: "The Air Yeezy 2 NRG ‘Solar Red’ may share a familiar color palette with its Air Yeezy ‘Blink’ predecessor, but the newer model stands out with a more refined silhouette, accented with special details crafted specifically for Kanye. They include a molded rubber heel, anaconda textured side panel, and Egyptology references on the tongue and midfoot strap. One feature carried over from the original Air Yeezy is the glow-in-the-dark outsole, utilized here on tooling lifted from the Nike Air Tech Challenge II.",
      sku: "508214 006",
      release_date: "09/06/2012",
      colorway: "Black/Black-Solar Red",
      brand: "Nike",
      silhouette: "Air Yeezy 2",
      technology: "Air",
      designer: "Kanye West" 
    },  
    {
      name: "Air Yeezy 2 NRG 'Pure Platinum'",
      description: "The Air Yeezy 2 NRG 'Pure Platinum' launched in June 2012 featuring a subdued colorway that blends varying shades of grey on the upper and a contrasting pop of bright red on the collar lining. The unique design allows it to straddle the line between fashion and sport. The snakeskin texture on the side panels and prominent ridges on the molded rubber heel serve to elevate the design, but the Air Tech Challenge II midsole keeps the shoe grounded in the heritage of the Swoosh.",
      sku: "508214 010",
      release_date: "09/06/2012",
      colorway: "Wolf Grey/Pure Platinum",
      brand: "Nike",
      silhouette: "Air Yeezy 2",
      technology: "Air",
      designer: "Kanye West" 
    },
    {
      name: "Air Yeezy 2 SP 'Red October'",
      description: "The Air Yeezy 2 SP ‘Red October’ stands out from its two companion colorways. There’s the monochromatic scarlet finish, contrasted only by metallic gold lace tips. There’s the unique design, which sees the side panels ditch the standard anaconda texture in favor of rows upon rows of small triangular studs. Finally, there’s the chaos that surrounded the shoe’s much-delayed release. By the time the Red Octobers finally launched online with no advance notice in February 2014, Kanye West had already severed all ties with Nike.",
      sku: "508214 660",
      release_date: "09/02/2014",
      colorway: "Red",
      brand: "Nike",
      silhouette: "Air Yeezy 2",
      technology: "Air",
      designer: "Kanye West" 
    }
  ]

  # Sneaker Factory Method
  air_yeezys.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  air_yeezys.each do |sneaker|
    case sneaker[:name]
    when "Air Yeezy 'Zen'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(3000, 4250) })
      end 
    when "Air Yeezy 'Blink'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(4500, 5500) })
      end 
    when "Air Yeezy 'Net'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(3500, 4750) })
      end 
    when "Air Yeezy 2 NRG 'Solar Red'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(4750, 6000) })
      end 
    when "Air Yeezy 2 NRG 'Pure Platinum'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(4250, 5500) })
      end 
    when "Air Yeezy 2 SP 'Red October'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(7000, 10000) })
      end
    end
  end

# Boost

  # Array of Sneaker Objects
  boosts = [
    {
      name: "UltraBoost 1.0 'OG'",
      description: "Dropping in February of 2015, the OG Ultra Boost silhouette combines a two-tone black and dark grey Primeknit upper with a purple heel cup. It also comes with a black three-stripe cage, black flat laces, gold aglets, white boost midsole, and a stretched web black rubber outsole. On the back of the shoe, a black padded mesh wraps around the heel to the reflective adidas tag on the tongue.",
      sku: "B27171",
      release_date: "18/03/2015",
      colorway: "Core Black/Purple/Gold Metallic",
      brand: "Adidas",
      silhouette: "UltraBoost",
      technology: "Boost",
      designer: "Ben Herath"
    },
    {
      name: "UltraBoost 1.0 LTD 'Cream'",
      description: "Initially, a friends and family exclusive, the ‘cream,’ ‘chalk,’ or ‘talc’ colorway was first previewed by Kanye’s barber, Ibn Jasper, via Instagram with the hashtags ouCantBuyThese and otForSale. Released in December 2015, the colorway instantly sold out online but a few pairs surfaced at both Undefeated and Need Supply in January and February 2016 restocks.",
      sku: "AQ5559",
      release_date: "12/12/2015",
      colorway: "Talc/Chalk White/Core Black",
      brand: "Adidas",
      silhouette: "UltraBoost",
      technology: "Boost",
      designer: "Ben Herath"
    },
    {
      name: "Sneakersnstuff x UltraBoost 1.0 'Tee Time'",
      description: "Stockholm’s top sneaker retailer Sneakernstuff teamed up with adidas consortium to drop this golf-inspired Ultra Boost in a ‘tee time’ two-pack alongside a wing-tipped leather EQT 93. This January 2016 limited release includes SNS branded heel tabs and aglets, blue and black tab holes on the tongues, and a grass printed insole.",
      sku: "AF5756",
      release_date: "22/01/2016",
      colorway: "Black/White",
      brand: "Adidas",
      silhouette: "UltraBoost",
      technology: "Boost",
      designer: "Ben Herath"
    },
    {
      name: "Kith x UltraBoost Mid 'Aspen'",
      description: "In December 2016, Kith Founder Ronnie Fieg celebrated the opening of his premiere pop-up location in Aspen, Colorado with this first-ever Ultra Boost Mid. Aptly named ‘Aspen,’ the design features a sweater-like Primeknit upper and matching multicolor laces as a nod to the area’s signature mountain style. The cage-less construction, sock-fit collar, and responsive Boost sole provide a cozy fit regardless of the weather.",
      sku: "BY2592",
      release_date: "31/12/2016",
      colorway: "Footwear White/Aspen/Core White",
      brand: "Adidas",
      silhouette: "UltraBoost",
      technology: "Boost",
      designer: "Ronnie Fieg"
    },
    {
      name: "A Bathing Ape x NMD_R1 'Olive Camo'",
      description: "Japanese streetwear boutique A Bathing Ape (BAPE) collaborated with adidas for two of the rarest NMD R1 sneakers ever released: The Bape x NMD_R1 'Olive' and 'Black' colorways. Both unveiled in July 2016 for a limited release through BAPE retailers and select adidas flagship stores. The ‘Olive’ colorway features BAPE’s iconic camouflage design across its upper with adidas’ three stripes on the side panels in white.",
      sku: "BA7326",
      release_date: "26/12/2016",
      colorway: "Olive",
      brand: "Adidas",
      silhouette: "NMD",
      technology: "Boost",
      designer: "Nic Galway"
    },
    {
      name: "NMD_R1 PK 'OG'",
      description: "The original adidas NMD dropped in December 2015 and defined the black/red/blue colorway. Building on adidas’ success with Ultra Boost, the Nomad quickly became one of the must-have shoes of 2016. The street-ready NMD gets an aesthetic updated with a black Primeknit upper, white Boost midsole, and 80s-inspired colorblocked midsole plugs.",
      sku: "S79168",
      release_date: "12/12/2015",
      colorway: "Black/Red/Blue",
      brand: "Adidas",
      silhouette: "NMD",
      technology: "Boost",
      designer: "Nic Galway"
    },
    {
      name: "Pharrell x NMD Human Race 'Yellow'",
      description: "The Pharrell x NMD 'Human Race' ‘EQT Yellow’ feature equipment yellow Primeknit uppers with black embroidery reading ‘HUMAN’ on the right foot and ‘RACE’ on the left. Released in July of 2016, the design also includes a black foot cage, white Boost midsoles, black bumpers, and a white outsole.",
      sku: "BB0619",
      release_date: "22/07/2016",
      colorway: "Yellow/Black",
      brand: "Adidas",
      silhouette: "NMD",
      technology: "Boost",
      designer: "Pharrell Williams"
    },
    {
      name: "Nice Kicks x NMD_R1 PK",
      description: "The adidas x Nice Kicks NMD Runner PK was a February 2016 collaboration between adidas Consortium and Austin sneaker store Nice Kicks to celebrate their new retail store in San Francisco's Haight/Ashbury. Inspired by the neighborhood's hippie past, the design features a red and black tie-dye design on the upper. The highly prized sneakers also come with Nice Kicks branded pull tabs.",
      sku: "AQ4791",
      release_date: "06/02/2016",
      colorway: "Red/Black/White",
      brand: "Adidas",
      silhouette: "NMD",
      technology: "Boost",
      designer: "Nic Galway"
    }
  ]

  # Sneaker Factory Method
  boosts.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  boosts.each do |sneaker|
    case sneaker[:name]
    when "UltraBoost 1.0 'OG'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(150, 250) })
      end 
    when "UltraBoost 1.0 LTD 'Cream'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(200, 300) })
      end 
    when "Sneakersnstuff x UltraBoost 1.0 'Tee Time'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(500, 800) })
      end 
    when "Kith x UltraBoost Mid 'Aspen'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(375, 500) })
      end 
    when "A Bathing Ape x NMD_R1 'Olive Camo'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(775, 1200) })
      end 
    when "NMD_R1 PK 'OG'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(200, 300) })
      end 
    when "Pharrell x NMD Human Race 'Yellow'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1200, 2100) })
      end 
    when "Nice Kicks x NMD_R1 PK"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1000, 1500) })
      end 
    end
  end

# Dunk

  # Array of Sneaker Objects
  dunks = [
    {
      name: "Jeff Staple x Dunk Low Pro SB 'Pigeon'",
      description: "The shoe that sparked riots on the streets of New York City—and received a subsequent mention on the front page of the New York Post—the Jeff Staple x Dunk Low Pro SB ‘Pigeon’ released in January 2005 as part of Nike SB’s White Dunk City Series. The low-top features two shades of grey on the upper, accented with a white Swoosh and pops of red on the lining and outsole. The all-important embroidered pigeon adorns the lateral heel.",
      sku: "304292 011",
      release_date: "22/02/2005",
      colorway: "Medium Grey/White-Dark Grey",
      brand: "Nike",
      silhouette: "Dunk",
      technology: "Zoom Air",
      designer: "Jeff Staple" 
    },
    {
      name: "Diamond Supply Co. x Dunk Low Pro SB 'Tiffany'",
      description: "Releasing in August 2005 as part of the Team Manager series, the Diamond Supply Co. x Dunk Low Pro SB ‘Tiffany’ drew long lines and campouts at skate shops throughout the country. The leather upper is finished in Aqua and accented with a metallic silver Swoosh. The black leather overlays feature a crocodile-embossed texture and contrast white stitching.",
      sku: "304292 402",
      release_date: "22/02/2005",
      colorway: "Medium Grey/White-Dark Grey",
      brand: "Nike",
      silhouette: "Dunk",
      technology: "Zoom Air",
      designer: "Jeff Staple" 
    },
    {
      name: "Concepts x Dunk Low SB 'Purple Lobster'",
      description: "Concepts and Nike SB are back at it again, with a new iteration of the 'Lobster' inspiration. The Dunk Low Premium SB 'Purple Lobster' is similar to the three previous executions, inspired by odd color specimens found in nature due to genetic abnormalities that make their exoskeleton appear in different shades, such as yellow, blue and purple. Special details include a red and white plaid pattern on the lining, and an elastic band wrapped around the forefoot similar to how lobster claws are secured.",
      sku: "BV1310 555",
      release_date: "01/08/2005",
      colorway: "Aqua/Chrome",
      brand: "Nike",
      silhouette: "Dunk",
      technology: "Zoom Air",
      designer: "Peter Moore" 
    },
    {
      name: "Supreme x Dunk Low Pro SB 'White Cement'",
      description: "In October 2002, Supreme gave the Dunk Low Pro SB the Air Jordan 3 treatment by utilizing the iconic elephant print on the upper. The colorway, known as 'White Cement,' pairs the cement print with white leather and a royal blue inner lining. With a limited release and the first Nike SB x Supreme collaboration, it’s considered to be one of the most sought-after SBs in the shoe’s history.",
      sku: "304292 001",
      release_date: "01/09/2002",
      colorway: "White/Black-Cement Grey",
      brand: "Nike",
      silhouette: "Dunk",
      technology: "Zoom Air",
      designer: "Peter Moore" 
    },
    {
      name: "Parra x Dunk Low OG SB QS",
      description: "Teaming up with the Dutch artist in July 2019, Nike SB and Parra present a special collaboration of the iconic Dunk Low OG QS. The visual artist's whimsical style is interpreted via multicolored chenille Swooshes on the leather upper and a graphic sockliner. A patterned tongue label and alternating co-branding embroidered on the backstay recognize both entities.",
      sku: "CN4504 100",
      release_date: "27/07/2019",
      colorway: "White/Pink Rise-Gym Red",
      brand: "Nike",
      silhouette: "Dunk",
      technology: "Zoom Air",
      designer: "Peter Moore" 
    },
    {
      name: "Stussy x Dunk Low Pro SB 'Cherry'",
      description: "The Stüssy x Dunk Low Pro SB released in July 2005 as part of Nike SB’s Team Manager series, in which industry team managers were given the opportunity to design their own shoes. Robbie Jeffers of Stüssy outfitted the Dunk Low in a colorway inspired by Neapolitan ice cream, complete with a Shy Pink base, brown leather overlays and a cream-colored Swoosh. Adorning the tongue tag is the proverbial cherry on top.",
      sku: "304292 671",
      release_date: "01/07/2005",
      colorway: "Dark Khaki/Shy Pink-Vanilla",
      brand: "Nike",
      silhouette: "Dunk",
      technology: "Zoom Air",
      designer: "Peter Moore" 
    }
  ]

  # Sneaker Factory Method
  dunks.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  dunks.each do |sneaker|
    case sneaker[:name]
    when "Jeff Staple x Dunk Low Pro SB 'Pigeon'"
      [ 9.5 ].each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(25000, 25000) })
      end 
    when "Diamond Supply Co. x Dunk Low Pro SB 'Tiffany'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1250, 2500) })
      end 
    when "Concepts x Dunk Low SB 'Purple Lobster'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(400, 750) })
      end 
    when "Supreme x Dunk Low Pro SB 'White Cement'"
      [ 10.0 ].each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(4000, 4000) })
      end 
    when "Parra x Dunk Low OG SB QS"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(225, 350) })
      end 
    when "Stussy x Dunk Low Pro SB 'Cherry'"
      [ 10.5 ].each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1100, 1100) })
      end 
    end
  end


# OW 'The Ten'

  # Array of Sneaker Objects
  the_ten = [
    {
      name: "OFF-WHITE x Air Jordan 1 Retro High OG 'Chicago'",
      description: "Created by designer Virgil Abloh, the Air Jordan 1 x OFF-WHITE comes in the classic Chicago colorway. Some of the sneakers' half-finished features include a Swoosh connected to the shoe with visible blue stitching, 'Air' printed on the midsole, and an OFF-WHITE zip tie on the collar. The box comes deconstructed as it's been turned inside-out with the inside consisting of a black base and gold Jumpman logo, while the outside is plain cardboard with the words 'Jumpman' printed on it. Virgil's OFF-WHITE collection included remixed iterations of the Air VaporMax, Air Presto, Air Max 90, Blazer, Air Max 97, Hyperdunk 2017, Air Force 1, Zoom Fly, and Chuck Taylor.",
      sku: "AA3834 101",
      release_date: "19/11/2017",
      colorway: "White/Black-Varsity Red-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Virgil Abloh" 
    },
    {
      name: "OFF-WHITE x Air Presto 'The Ten'",
      description: "The Off-White x Air Presto was released as part of ‘The Ten’ — a collaborative capsule from Virgil Abloh and Nike exploring ten classic silhouettes through two distinct themes: ‘Revealing,’ featuring hand-cut and reconstructed builds, and ‘Ghosting,’ characterized by translucent uppers. Grouped in the former category, the Air Presto is updated with unique details like a tonal Swoosh on the mesh upper, plastic zip tie, and ‘AIR’ printed on the heel strap.",
      sku: "AA3830 001",
      release_date: "19/11/2017",
      colorway: "Black/Black-Muslin",
      brand: "Nike",
      silhouette: "Air Presto",
      technology: "Air",
      designer: "Virgil Abloh" 
    },
    {
      name: "OFF-WHITE x Air VaporMax 'The Ten'",
      description: "Released at Nikelab stores in November of 2017, the OFF-WHITE x Air VaporMax was part of Virgil Abloh's 10-pair collaboration with Nike and quickly became one of the most coveted kicks of the year. The design features a black Flyknit upper with an oversized white stitched Swoosh, orange accents, and a full-length blacked-out Air VaporMax sole. The sneaker also includes a retro-style tongue and the collection's quotation mark motif can be found on the shoelaces and side panels.",
      sku: "AA3831 001",
      release_date: "19/11/2017",
      colorway: "Black/White-Clear",
      brand: "Nike",
      silhouette: "Air Vapormax",
      technology: "Air",
      designer: "Virgil Abloh" 
    },
    {
      name: "OFF-WHITE x Blazer Mid 'The Ten'",
      description: "Virgil Abloh's Nike OFF-WHITE Blazer Mid features a white leather upper with an oversized black Nike Swoosh that descends into the midsole. The four lace options – white, black, neon orange, and neon green – come with Abloh's signature self-referential “SHOELACES” branding. Released in September 2017, this sneaker is a member of the initial five-pair REVEALING group of the Off-White x Nike 'The Ten' Collection that included reconstructed designs for the Air Jordan 1, Air Max 90, Nike Air Presto, and Nike Air VaporMax.",
      sku: "AA3832 100",
      release_date: "19/11/2017",
      colorway: "White/Black-Muslin",
      brand: "Nike",
      silhouette: "Blazer",
      technology: "-",
      designer: "Virgil Abloh" 
    },
    {
      name: "OFF-WHITE x Air Force 1 Low 'The Ten'",
      description: "Released as part of the ‘The Ten’ collection from Virgil Abloh and Nike, the Off-White x Air Force 1 is transformed through the use of a translucent upper – an effect the designer calls ‘ghosting.’ Abloh characterizes this model as one of the most experimental designs from ‘The Ten,’ as it takes a foundational sneaker and radically reduces it, removing all the layers practically down to the padding, so that it’s still technically an Air Force 1, but just barely.",
      sku: "AO4606 100",
      release_date: "19/11/2017",
      colorway: "White/White-Sail",
      brand: "Nike",
      silhouette: "Air Force 1",
      technology: "Air",
      designer: "Virgil Abloh" 
    },
    {
      name: "OFF-WHITE x Air Max 97 OG 'The Ten'",
      description: "Released as part of ‘The Ten’ collection from November 2017, Virgil Abloh’s take on the Air Max 97 focuses on the shoe’s upper. The retro runner’s translucent build serves to tone down the visual impact of its signature wavy lines, so that the eye is drawn to the overall shape instead. ‘AIR’ stamped on the lateral side serves as a reminder of the technical innovation inherent in the '97 – the first Nike silhouette to feature a full-length Max Air unit.",
      sku: "AJ4585 100",
      release_date: "19/11/2017",
      colorway: "White",
      brand: "Nike",
      silhouette: "Air Max 97",
      technology: "Air",
      designer: "Virgil Abloh" 
    },
    {
      name: "OFF-WHITE x Air Max 90 'The Ten'",
      description: "Virgil Abloh's Nike OFF-WHITE x Air Max 90 Ice combines a white leather upper with ice blue foam and grey suede overlays, a stitched reflective white Nike Swoosh, signature orange tag, and a grey suede heel patch. Released in September 2017, this highly prized release was a member of the initial five-pair REVEALING group of the Off-White x Nike “The Ten' Collection that included reconstructed designs for the Air Jordan 1, Nike Blazer, Nike Air Presto, and Nike Air VaporMax.",
      sku: "AA7293 100",
      release_date: "19/11/2017",
      colorway: "Sail/White-Muslin",
      brand: "Nike",
      silhouette: "Air Max 90",
      technology: "Air",
      designer: "Virgil Abloh" 
    },
    {
      name: "OFF-WHITE x Hyperdunk 2017 'The Ten'",
      description: "What sets apart the Off-White x Hyperdunk from the majority of sneakers from ‘The Ten’ – the collection of collaborative sneakers from Virgil Abloh and Nike – is that it’s a pure performance sneaker. Underneath the translucent components, including an added midfoot strap, is a breathable knit upper, mounted atop a React foam midsole. Virgil’s suite of signature design embellishments gives the shoe a cohesive design language that makes the built-in technology relatable and wearable for lifestyle.",
      sku: "AJ4578 100",
      release_date: "19/11/2017",
      colorway: "White/White-White",
      brand: "Nike",
      silhouette: "Hyperdunk",
      technology: "React",
      designer: "Virgil Abloh" 
    },
    {
      name: "OFF-WHITE x Chuck 70 'The Ten'",
      description: "The final pair of Virgil Abloh's 'The Ten' collection, the OFF-WHITE x Chuck Taylor All-Star 70 was released in May 2017 as part of the 'GHOSTING' pack. Featuring a translucent white upper and an ice-blue gradient on the sole, the shoe features bold lettering along its silhouette: 'LEFT' and 'RIGHT' on the toecaps, 'VULCANIZED' over the midsole, “SHOELACES” on each lace, with Off-White's stamp on each side-panel. A red zip-tie hooked through the laces completes the look.",
      sku: "162204C",
      release_date: "08/05/2018",
      colorway: "Clear/White-White",
      brand: "Converse",
      silhouette: "Chuck Taylor All Star",
      technology: "-",
      designer: "Virgil Abloh" 
    },
    {
      name: "OFF-WHITE x Zoom Fly SP 'The Ten'",
      description: "The Off-White x Zoom Fly is one of five sneakers from ‘The Ten’ collection that features a translucent synthetic upper— a design quirk that Virgil Abloh leverages here as a means of revealing the performance runner’s inner workings. It’s a final consumer product that’s cloaked in the trappings of an early-stage prototype, mounted on a highly responsive Foam midsole that’s ready to take on the streets.",
      sku: "AJ4588 100",
      release_date: "19/11/2017",
      colorway: "White/White-Muslin",
      brand: "Nike",
      silhouette: "Zoom Fly",
      technology: "Lunarlon",
      designer: "Virgil Abloh" 
    },
  ] 

  # Sneaker Factory Method
  the_ten.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  the_ten.each do |sneaker|
    case sneaker[:name]
    when "OFF-WHITE x Air Jordan 1 Retro High OG 'Chicago'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(3750, 6000) })
      end 
    when "OFF-WHITE x Air Presto 'The Ten'"
      [ 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0 ].each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(2150, 3000) })
      end 
    when "OFF-WHITE x Air VaporMax 'The Ten'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1500, 2200) })
      end 
    when "OFF-WHITE x Blazer Mid 'The Ten'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1400, 2000) })
      end 
    when "OFF-WHITE x Air Force 1 Low 'The Ten'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1600, 2000) })
      end 
    when "OFF-WHITE x Air Max 97 OG 'The Ten'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1200, 1750) })
      end 
    when "OFF-WHITE x Air Max 90 'The Ten'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1150, 1600) })
      end 
    when "OFF-WHITE x Hyperdunk 2017 'The Ten'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(800, 1100) })
      end 
    when "OFF-WHITE x Chuck 70 'The Ten'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1200, 1500) })
      end 
    when "OFF-WHITE x Zoom Fly SP 'The Ten'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(900, 1300) })
      end 
    end
  end

# Air Force 1

  # Array of Sneaker Objects 
  air_force_1s = [
    {
      name: "Air Force 1 '07 'White'",
      description: "The Nike Air Force 1 Low is a modern take on the iconic white on white low top Air Force 1. Released in honor of the classic shoe's 25th anniversary in 2007, the sneaker features an upgraded, crispier 10A full grain leather white upper with a matching white Air-cushioned rubber sole.",
      sku: "315122 111",
      release_date: "31/12/2017",
      colorway: "White/White",
      brand: "Nike",
      silhouette: "Air Force 1",
      technology: "Air",
      designer: "Bruce Kilgore" 
    },
    {
      name: "OFF-WHITE x Air Force 1 Low '07 'MCA'",
      description: "In celebration of his exhibit premiering at the Museum of Contemporary Art in Chicago in June 2019, Virgil Abloh teamed up with Nike once again to produce a Nike Air Force 1. The OFF-WHITE x Air Force 1 Low '07 'MCA' shoe features a University Blue leather upper and a Metallic Silver Swoosh with prominent stitching and a signature red tab. For a full circle-feel, the shoe reprises key design details from previous OFF-WHITE offerings, including the iconic zip tie and quoted branding.",
      sku: "CI1173 400",
      release_date: "20/07/2019",
      colorway: "University Blue/White-Red",
      brand: "Nike",
      silhouette: "Air Force 1",
      technology: "Air",
      designer: "Virgil Abloh" 
    },
    {
      name: "Travis Scott x Air Force 1 'Sail'",
      description: "The ‘Sail’ colorway of Travis Scott’s Air Force 1 represents the Houston rapper’s second collaboration with Nike on the classic silhouette. Aside from swapping out the all-white finish of its predecessor with slightly darker Sail, the new model is mostly unchanged. Tonal canvas construction is accented with removable Swooshes and tongue patches, while the shiny lace jewels give a nod to Scott’s signature grill.",
      sku: "AQ4211 101",
      release_date: "10/08/2018",
      colorway: "Sail/Gum Light Brown/Sail",
      brand: "Nike",
      silhouette: "Air Force 1",
      technology: "Air",
      designer: "Travis Scott" 
    },
    {
      name: "Supreme x Comme des Garçons x Air Force 1 Low 'Black'",
      description: "The Supreme x Comme des Garçons SHIRT x Air Force 1 Low released as part of the NYC streetwear brand’s Fall/Winter 2018 collection. The retro low-top features a subtly textured black leather upper, accented with a contrasting white leather Swoosh that’s broken up and misaligned in the middle. On the back of the shoe, directly underneath the Nike Air branded heel tab, are the Comme des Garçons SHIRT and Supreme wordmarks stamped in white.",
      sku: "AR7623 001",
      release_date: "08/11/2018",
      colorway: "Black/White",
      brand: "Nike",
      silhouette: "Air Force 1",
      technology: "Air",
      designer: "Bruce Kilgore" 
    },
    {
      name: "Air Force 1 High '07 LV8 WB 'Flax'",
      description: "Nike brought back the Air Force 1 High ‘Flax’ colorway as part of their highly anticipated Wheat Collection. Like the previous iteration, the design is dressed in a Flax nubuck upper with tonal laces, tactical ankle straps, and branding atop a gum rubber outsole. Released in 2017, the collection also includes versions of the Air More Uptempo, Air Force 1 Mid, Air Max 90, Air Max 1, Air Huarache, Air Max 95 Sneakerboot, and Air Footscape Woven.",
      sku: "882096 200",
      release_date: "27/10/2017",
      colorway: "Flax/Flax-Gum Light Brown",
      brand: "Nike",
      silhouette: "Air Force 1",
      technology: "Air",
      designer: "Bruce Kilgore" 
    },
    {
      name: "SF Air Force 1 'Faded Olive'",
      description: "The Nike Special Field Air Force 1 ‘Faded Olive’ features a premium leather upper with ballistic nylon on the heel, and removable dual ankle straps. The military-inspired design also features an espionage pocket and a gum rubber midsole and outsole unit. Released in November of 2016, the silhouette dropped alongside a ‘Gum’ model, as well as two women-only colorways, ‘Light Bone’ and ‘Golden Beige.’",
      sku: "859202 339",
      release_date: "04/11/2016",
      colorway: "Faded Olive/Gum Light Brown",
      brand: "Nike",
      silhouette: "Air Force 1",
      technology: "Air",
      designer: "Bruce Kilgore" 
    }
  ]

  # Sneaker Factory Method
  air_force_1s.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  air_force_1s.each do |sneaker|
    case sneaker[:name]
    when "Air Force 1 '07 'White'"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(80, 120) })
      end 
    when "OFF-WHITE x Air Force 1 Low '07 'MCA'"
       main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(2250, 3000) })
      end 
    when "Travis Scott x Air Force 1 'Sail'"
       main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(650, 1000) })
      end 
    when "Supreme x Comme des Garçons x Air Force 1 Low 'Black'"
       main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(425, 600) })
      end 
    when "Air Force 1 High '07 LV8 WB 'Flax'"
       main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(80, 150) })
      end 
    when "SF Air Force 1 'Faded Olive'"
       main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(400, 500) })
      end 
    end
  end

# Misc Jordans
  # Array of Sneaker Objects
  jordans = [
    {
      name: "Air Jordan 3 Retro OG 'Black Cement' 2018",
      description: "The Air Jordan 3 was the first of many for Michael Jordan and Tinker Hatfield. It was the first time they would work together on the signature shoe, it was the first time the elephant print made an appearance on a shoe, and it was the first time the “Jumpman” logo adorned the tongue with the classic “NIKE AIR” stamped on the heel. The Black/Cement Air Jordan 3 Retro OG comes back in its original form. Featuring black tumbled and smooth leather uppers and all the distinct details we remember thirty years later.",
      sku: "854262 001",
      release_date: "17/02/2018",
      colorway: "Black/Cement Grey-White-Fire Red",
      brand: "Air Jordan",
      silhouette: "Air Jordan 3",
      technology: "Air",
      designer: "Tinker Hatfield"
    },
    {
      name: "Air Jordan 3 Retro NRG 'Tinker'",
      description: "A 1988 Tinker Hatfield Air Jordan 3 sketch comes off the page and into reality for the first time ever. This Tinker edition shows off Hatfield’s unique idea to utilize a Nike swoosh on the lateral profile, with a stitched NIKE logo on the medial side. These details were removed in the final Air Jordan 3 design in favor of a more clean look. Launched on the designer’s birthday in 2018, Tinker’s signature can be found stitched on the inside of the tongue as well as on the box top and hang tag.",
      sku: "AQ3835 160",
      release_date: "24/03/2018",
      colorway: "Black/Cement Grey-White-Fire Red",
      brand: "Air Jordan",
      silhouette: "Air Jordan 3",
      technology: "Air",
      designer: "Tinker Hatfield"
    },
    {
      name: "Air Jordan 3 Retro OG 'White Cement' 2013",
      description: "In 2013, the Jordan Brand released the Air Jordan 3 Retro 88 commemorating the 25th anniversary of Jordan's free-throw line dunk. The sneaker even launched at 3:51 pm, the exact time Jordan took off and sealed his victory. This was the first Jordan Retro to feature NIKE AIR branding on the heel since the first 1994 retros.",
      sku: "580775 160",
      release_date: "06/02/2013",
      colorway: "White/Fire Red-Cement Grey-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 3",
      technology: "Air",
      designer: "Tinker Hatfield"
    },
    {
      name: "Travis Scott x Air Jordan 4 Retro 'Cactus Jack'",
      description: "Music artist Travis Scott hails from Houston, where the Oilers used to take the field in red, white and blue uniforms. The Travis Scott x Air Jordan 4 Retro 'Cactus Jack' colorway pays tribute to the city’s bygone football team with a Durabuck leather upper dressed in University Blue and a Varsity Red insole. The black lace cage and a heel panel feature a light blue speckle pattern. Cactus Jack branding appears on the left heel in Varsity Red, with a matching Jumpman logo on the right.",
      sku: "308497 406",
      release_date: "09/06/2018",
      colorway: "University Blue/Varsity Red-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 4",
      technology: "Air",
      designer: "Travis Scott"
    },
    {
      name: "Air Jordan 4 Retro OG 'Bred' 2019",
      description: "The 2019 edition of the Air Jordan 4 ‘Bred’ celebrates the 30th anniversary of the classic silhouette, appearing in the same colorway that Michael Jordan wore when he sank ‘The Shot’ during the first round of the 1989 NBA playoffs. It’s rendered in a build that’s faithful to the original, complete with a black nubuck upper, visible Air Sole cushioning underfoot and Nike Air branding on the heel.",
      sku: "308497 060",
      release_date: "04/05/2019",
      colorway: "Black/Cement Grey-White-Fire Red",
      brand: "Air Jordan",
      silhouette: "Air Jordan 4",
      technology: "Air",
      designer: "Tinker Hatfield"
    },
    {
      name: "Air Jordan 4 Retro OG 'White Cement' 2016",
      description: "The Air Jordan 4 Retro OG 'Cement’ 2016 was one of the original four colorways released in 1989. The sneaker features the original White, Fire Red, Black, and Tech Grey colorway, with the speckled Cement Grey accents that give the sneaker its nickname. Released during the 2016 NBA All-Star weekend in Toronto, the sneaker was also retro’d in 1999 and 2012. The 1999 and 2016 retros are the only models that feature the ‘Nike Air’ branding on the heel, just like the 1989 OG sneakers.",
      sku: "840606 192",
      release_date: "13/02/2016",
      colorway: "White/Fire Red-Cement Grey-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 4",
      technology: "Air",
      designer: "Tinker Hatfield"
    },
    {
      name: "KAWS x Air Jordan 4 Retro",
      description: "The KAWS x Air Jordan 4 Retro is a collaboration between the Jordan Brand and Brooklyn-based street artist KAWS, a.k.a. Brian Donnelly. The design removes the silhouette’s traditional plastic accents and dresses the entire upper and midsole in a premium grey suede upper. The sneaker also features KAWS’ ‘XX’ branding on the heel tab. The shoes were released alongside a small capsule collection that included a coaches jacket, hoodie, t-shirt, and hat in March of 2017. The hype was so intense for this release that the in-store raffle at Patta in London was read the riot act by the police and sneakerheads hacked into Donnelly’s website for a chance at the drop.",
      sku: "930155 003",
      release_date: "31/03/2017",
      colorway: "Cool Grey/White",
      brand: "Air Jordan",
      silhouette: "Air Jordan 4",
      technology: "Air",
      designer: "Brian Donnelly"
    },
    {
      name: "Travis Scott x Air Jordan 6 Retro 'Olive'",
      description: "The Travis Scott x Air Jordan 6 Retro 'Olive' represents a collaboration between the Houston based rapper and Jordan Brand. This take on the AJ 6, which Scott debuted while performing during halftime of Super Bowl 53, released in September 2019. It features a Medium Olive, black, Sail and University Red colorway along with several unique elements: a small pocket with a snap on the collar, a nubuck and suede upper, Scott's 'Cactus Jack' logo on the heel and a glow-in-the-dark translucent outsole.",
      sku: "CN1084 200",
      release_date: "14/09/2019",
      colorway: "Medium Olive/Black-Sail-Red",
      brand: "Air Jordan",
      silhouette: "Air Jordan 6",
      technology: "Air",
      designer: "Travis Scott"
    },
    {
      name: "Air Jordan 6 Retro 'Infrared' 2019",
      description: "The 2019 edition of the Air Jordan 6 Retro ‘Infrared’ is true to the original colorway, which Michael Jordan wore when he captured his first NBA title. Dressed primarily in black nubuck with a reflective 3M layer underneath, the mid-top features Infrared accents on the midsole, heel tab and lace lock. Nike Air branding adorns the heel and sockliner, an OG detail last seen on the 2000 retro.",
      sku: "384664 060",
      release_date: "16/02/2019",
      colorway: "Black/Infrared 23-Black",
      brand: "Air Jordan",
      silhouette: "Air Jordan 6",
      technology: "Air",
      designer: "Tinker Hatfield"
    },
    {
      name: "Air Jordan 11 Retro 'Concord' 2018",
      description: "The 2018 edition of the Air Jordan 11 Retro ‘Concord’ features ‘45’ stamped on the black heel tab—a nod to the jersey number that Michael Jordan wore upon his return to basketball following his first retirement. The rest of the build keeps the shoe’s signature details intact, including a white ballistic mesh upper, black patent leather overlays and an icy translucent outsole underfoot.",
      sku: "378037 100",
      release_date: "08/12/2018",
      colorway: "White/Black-Dark Concord",
      brand: "Air Jordan",
      silhouette: "Air Jordan 11",
      technology: "Air",
      designer: "Tinker Hatfield"
    },
    {
      name: "Air Jordan 11 Retro 'Space Jam' 2016",
      description: "The Air Jordan 11 Retro ‘Space Jam’ 2016 commemorates the 20th anniversary of the movie ‘Space Jam.’ Worn by Michael Jordan as a Player Exclusive (PE) in both the movie and the 1995 NBA Playoffs, the 2016 retro ended up being Nike’s largest and most successful shoe launch ever. This 2016 sneaker is a more faithful reproduction of the original PE than the 2000 and 2009 retros. The sneaker also swaps the traditional 3 for MJ’s comeback 5 on the heel, a first for an Air Jordan 11 retail release.",
      sku: "378037 003",
      release_date: "09/12/2016",
      colorway: "Black/Concord-White",
      brand: "Air Jordan",
      silhouette: "Air Jordan 11",
      technology: "Air",
      designer: "Tinker Hatfield"
    },
    {
      name: "Air Jordan 11 Retro 'Bred' 2012",
      description: "Released in December, the Air Jordan 11 Retro ‘Bred’ 2012 brings back the famous black/red colorway to the Jordan 11 silhouette. The design features a black mesh upper with black patent leather overlays, red Jumpman accents, a white midsole, and a translucent red outsole. Originally released in 1995, the sneaker was retro’d in 2001 and in 2008 alongside an Air Jordan 12 as part of the ‘Collezione Pack’.",
      sku: "378037 010",
      release_date: "21/12/2012",
      colorway: "Black/Varsity Red-White",
      brand: "Air Jordan",
      silhouette: "Air Jordan 11",
      technology: "Air",
      designer: "Tinker Hatfield"
    }
  ]

  # Sneaker Factory Method
  jordans.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  jordans.each do |sneaker|
    case sneaker[:name]
    when "Air Jordan 3 Retro OG 'Black Cement' 2018"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(240, 300) })
      end
    when "Air Jordan 3 Retro NRG 'Tinker'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(175, 250) })
      end
    when "Air Jordan 3 Retro OG 'White Cement' 2013"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(350, 550) })
      end 
    when "Travis Scott x Air Jordan 4 Retro 'Cactus Jack'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(600, 1000) })
      end 
    when "Air Jordan 4 Retro OG 'Bred' 2019"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(225, 300) })
      end 
    when "Air Jordan 4 Retro OG 'White Cement' 2016"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(350, 475) })
      end 
    when "KAWS x Air Jordan 4 Retro"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1400, 1800) })
      end 
    when "Travis Scott x Air Jordan 6 Retro 'Olive'"
      [ 9.5, 10.0, 12.0 ].each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(1500, 2000) })
      end 
    when "Air Jordan 6 Retro 'Infrared' 2019"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(250, 315) })
      end 
    when "Air Jordan 11 Retro 'Concord' 2018"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(250, 325) })
      end 
    when "Air Jordan 11 Retro 'Space Jam' 2016"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(350, 450) })
      end 
    when "Air Jordan 11 Retro 'Bred' 2012"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(350, 500) })
      end 
    end
  end

# Air Max

  # Array of Sneaker Objects 
  air_maxes = [
    {
      name: "Air Max 1 OG 'Anniversary' 2017",
      description: "Air Max 1 OG 'Anniversary' 2017 Rerelease was a 2017 re-release of the 1987 OG University Red colorway. The design combines a white and grey upper with a University Red Swoosh and University Red overlays around the base. Initially released in limited quantities in March of 2017, the sneaker re-stocked in October of 2017.",
      sku: "908375 103",
      release_date: "21/09/2017",
      colorway: "White/University Red",
      brand: "Nike",
      silhouette: "Air Max 1",
      technology: "Air",
      designer: "Tinker Hatfield" 
    },
    {
      name: "Parra x Air Max 1 'Parra' 2018",
      description: "Following a decades-old history of collaborations between Amsterdam-based artist Piet Parra and Nike, this July 2018 release celebrates the reunion of Parra and Nike on yet another Air Max 1. The shoe debuted alongside a track jacket and Zoom Spiridon. The upper features colorful fragments from the artist’s work, inspired by the Dutch countryside and his love of visual pop culture.",
      sku: "AT3057 100",
      release_date: "21/07/2018",
      colorway: "White/Pure Platinum",
      brand: "Nike",
      silhouette: "Air Max 1",
      technology: "Air",
      designer: "Tinker Hatfield" 
    },
    {
      name: "Atmos x Air Max 1 Retro 'Elephant' 2017",
      description: "The Atmos x Air Max 1 'Elephant' 2017 was a re-release of a 2006 collaboration with Tokyo-based brand Atmos. The winner of the 2016 Vote Back contest, the design combines a black suede upper with a white toe box, elephant print overlays, and clear jade accents. Re-released on Air Max Day, the sneaker also comes with a white midsole and black outsole.",
      sku: "908366 001",
      release_date: "18/03/2017",
      colorway: "Black/Clear Jade/White",
      brand: "Nike",
      silhouette: "Air Max 1",
      technology: "Air",
      designer: "Tinker Hatfield" 
    },
    {
      name: "Atmos x Air Max 1 DLX 'Animal Pack' 2018",
      description: "The atmos x Air Max 1 DLX is inspired by the 2006 collaboration between Nike and atmos. For this updated edition of the original design, Nike has reconnected with the Japanese sneaker boutique to once again create a shoe dressed in pony, tiger, zebra, and leopard prints. The 2018 Air Max 1 features black detailing on the upper, replacing the ivory colors of the 2006 model. This design represents one half of Nike’s 2018 'Animal Pack' with atmos, the other being an Air Max 95.",
      sku: "AQ0928 700",
      release_date: "17/03/2018",
      colorway: "Wheat/Bison-Classic Green-Red",
      brand: "Nike",
      silhouette: "Air Max 1",
      technology: "Air",
      designer: "Tinker Hatfield" 
    },
    {
      name: "Air Max 90 OG 'Infrared' 2015",
      description: "The Nike Air Max 90 OG 'Infrared' 2015 was released in June of 2015 in celebration of the 25th anniversary of the iconic Air Max 90 silhouette. This retro version comes with a white mesh upper with grey suede and black leather overlays and Infrared accents on the tongue, heel, eyelets, midsole, and outsole.",
      sku: "725233 106",
      release_date: "28/05/2015",
      colorway: "White/Cement Grey-Infrared-Black",
      brand: "Nike",
      silhouette: "Air Max 1",
      technology: "Air",
      designer: "Tinker Hatfield" 
    },
    {
      name: "Sean Wotherspoon x Air Max 1/97",
      description: "Released for Air Max Day in 2018, this Sean Wotherspoon designed hybrid won the ‘Vote Forward’ campaign. This new creation combines the upper of an Air Max 97 with an Air Max 1 sole. The shoe features a retro-inspired multicolored corduroy upper with corduroy pull tabs, Velcro tongue patches, and an Infrared Air unit.",
      sku: "AJ4219 400",
      release_date: "26/03/2018",
      colorway: "Light Blue Fury/Lemon Wash",
      brand: "Nike",
      silhouette: "Air Max 97/1",
      technology: "Air",
      designer: "Sean Wotherspoon" 
    },
    {
      name: "Air Max 97 OG QS 'Silver Bullet' 2017",
      description: "The Nike Air Max 97 OG QS 'Silver Bullet' 2017 was brought back in this original color way in celebration of the sneaker’s 20th anniversary. The Christian Tresser-designed Nike Air Max 97 offers a sleek style without compromising comfort. The classic design features a Metallic Silver, Varsity Red and white color scheme on a mesh upper that is reinforced by its signature overlays inspired by the ripples around a droplet of water. The foam midsole houses a full-length Total Max unit, helping provide optimal support and cushioning.",
      sku: "884421 001",
      release_date: "13/04/2017",
      colorway: "Metallic Silver/Red-White",
      brand: "Nike",
      silhouette: "Air Max 97",
      technology: "Air",
      designer: "Christian Tresser" 
    },
    {
      name: "Air Max 97 OG QS 'Metallic Gold'",
      description: "The Nike Air Max 97 OG QS 'Metallic Gold’ is an original colorway that comes in a metallic gold upper, red swoosh accents, and a black inner lining. Released in April of 2017, the sneaker also includes a black heel tab, a full-length Total Max unit, and a black outsole.",
      sku: "884421 700",
      release_date: "18/05/2017",
      colorway: "Metallic Gold/Red-White",
      brand: "Nike",
      silhouette: "Air Max 97",
      technology: "Air",
      designer: "Christian Tresser" 
    },
    {
      name: "Undefeated x Air Max 97 OG 'Black'",
      description: "The Undefeated x Air Max 97 OG 'Black' pays tribute to Italy's special relationship with the Air Max 97. The Gucci-inspired design features a black-based upper with a patent leather mudguard and a Gucci-inspired Gorge Green/Speed Red wavy side panel stripe. Undefeated branding runs the length of the red stripe, and the brand's tally logo hits up the insole. Released in September 2017 alongside a 'Sail' colorway, the sneaker celebrates the 20th anniversary of the Air Max 97 and the LA boutique's 15th year serving West Coast sneakerheads.",
      sku: "AJ1986 001",
      release_date: "21/09/2017",
      colorway: "Black/Gorge Green-White-Red",
      brand: "Nike",
      silhouette: "Air Max 97",
      technology: "Air",
      designer: "Christian Tresser" 
    },
    {
      name: "Undefeated x Air Max 97 OG 'Sail'",
      description: "The Undefeated x Air Max 97 OG 'Sail' pays tribute to Italy's special relationship with the Air Max 97. The Gucci-inspired design features a white-based upper, white patent leather mudguard, and a Gucci-inspired Gorge Green/Speed Red wavy side panel stripe. Undefeated branding runs the length of the red stripe, and the brand's tally logo hits up the insole. Released in September 2017 alongside a 'Black' colorway, the sneaker celebrates the 20th anniversary of the Air Max 97 and the LA boutique's 15th year serving West Coast sneakerheads.",
      sku: "AJ1986 100",
      release_date: "16/09/2017",
      colorway: "Sail/Gorge Green-White-Red",
      brand: "Nike",
      silhouette: "Air Max 97",
      technology: "Air",
      designer: "Christian Tresser" 
    },
    {
      name: "Supreme x Air Max 98 'Snakeskin'",
      description: "The Supreme x Nike Air Max 98 'Snakeskin’ features a metallic silver mesh upper with reflective piping and Sail snakeskin overlays. The sneaker also comes with Supreme branding at the heel tabs and toe, ‘WORLD FAMOUS’ branding at the heels, a white full-length Air unit, and a silver rubber outsole. Released in April 2016, the ‘Snakeskin’ dropped alongside ‘Black,’ ‘Red,’ and ‘Blue’ colorways and a co-branded Dri-FIT running hat in five colors.",
      sku: "844694 100",
      release_date: "30/04/2016" "16/09/2017",
      colorway: "Sail/Metallic Silver-Varsity Red",
      brand: "Nike",
      silhouette: "Air Max 98",
      technology: "Air",
      designer: "Sergio Lozano" 
    },
    {
      name: "Nike Mag 2016 'Auto-Lacing'",
      description: "The imaginary Nike Mag self-lacing sneakers from 1989’s Back to the Future 2 became a reality nearly 30 years later when Nike released a super-limited edition of just 89 pairs in 2016. Original pairs were made available via an online raffle in which proceeds benefited Back to the Future actor Michael J. Fox’s foundation for Parkinson’s disease. The sensor-equipped shoe automatically tightens and loosens to fit the unique shape of the wearer. Integrated glowing lights in the midsole, heel, and strap highlight the futuristic form.",
      sku: "AMG 16",
      release_date: "17/10/2016",
      colorway: "Jetstream/White-Pale Blue",
      brand: "Nike",
      silhouette: "Nike Mag",
      technology: "Adapt",
      designer: "Tinker Hatfield" 
    }
  ]
  
  # Sneaker Factory Method
  air_maxes.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  air_maxes.each do |sneaker|
    case sneaker[:name]
    when "Air Max 1 OG 'Anniversary' 2017"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(150, 250) })
      end 
    when "Parra x Air Max 1 'Parra' 2018"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(375, 550) })
      end 
    when "Atmos x Air Max 1 Retro 'Elephant' 2017"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(700, 1000) })
      end 
    when "Atmos x Air Max 1 DLX 'Animal Pack' 2018"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(325, 500) })
      end 
    when "Air Max 90 OG 'Infrared' 2015"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(220, 350) })
      end 
    when "Sean Wotherspoon x Air Max 1/97"
      full_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(800, 1050) })
      end 
    when "Air Max 97 OG QS 'Silver Bullet' 2017"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(300, 425) })
      end 
    when "Air Max 97 OG QS 'Metallic Gold'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(180, 250) })
      end 
    when "Undefeated x Air Max 97 OG 'Black'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(400, 550) })
      end 
    when "Undefeated x Air Max 97 OG 'Sail'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(350, 500) })
      end 
    when "Supreme x Air Max 98 'Snakeskin'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(475, 800) })
      end 
    when "Nike Mag 2016 'Auto-Lacing'"
      [ 9.0 ].each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(75000 ,75000) })
      end 
    end
  end

# Fear of God

  # Array of Sneaker Objects 
  fogs = [
    {
      name: "Air Fear Of God 1 'Black'",
      description: "The Air Fear of God 1 ‘Black’ is one of the inaugural colorways of the performance basketball shoe made in collaboration between Nike and Jerry Lorenzo’s Fear of God. The fashion-forward silhouette uses a brand new last made expressly for the specific model, topped with a minimalist black leather upper with a TPU cage inspired by the Huarache Light. The tooling takes the form of a contrasting white cup sole with a visible double-stack Zoom heel unit.",
      sku: "AR4237 001",
      release_date: "15/12/2018",
      colorway: "Black/Black",
      brand: "Nike",
      silhouette: "Air Fear Of God 1",
      technology: "Air",
      designer: "Jerry Lorenzo" 
    },
    {
      name: "Air Fear Of God 1 'Light Bone'",
      description: "The Air Fear of God 1 ‘Light Bone’ represents the very first collaboration between the Swoosh and Jerry Lorenzo, who worked on the unique silhouette with Nike designer Leo Chang. The performance basketball shoe features a Light Bone leather upper, supported by a tonal TPU cage inspired by the Huarache Light. The tooling showcases a visible double-stack Zoom heel unit that’s augmented by full-length Zoom cushioning.",
      sku: "AR4237 002",
      release_date: "19/01/2019",
      colorway: "Light Bone/Black",
      brand: "Nike",
      silhouette: "Air Fear Of God 1",
      technology: "Air",
      designer: "Jerry Lorenzo" 
    },
    {
      name: "Air Fear Of God Raid 'Black'",
      description: "Nike and frequent collaborator Fear Of God designer, Jerry Lorenzo, joined forces once again for the Air Fear Of God Raid 'Black' sneaker. Released in May 2019, the uniquely designed silhouette is inspired by one of Lorenzo’s favorite Nike designs, the Air Raid. Outfitted with a cross strap suede and textile upper above; below, its equipped with a double stacked Zoom Air unit in heel for a retro, yet futuristic finish.",
      sku: "AT8087 002",
      release_date: "17/05/2019",
      colorway: "Black/Black-Fossil",
      brand: "Nike",
      silhouette: "Air Fear Of God Raid",
      technology: "Air",
      designer: "Jerry Lorenzo" 
    },
    {
      name: "Air Fear Of God Raid 'Light Bone'",
      description: "Created by acclaimed streetwear designer Jerry Lorenzo for release in April 2019, the Air Fear of God Raid 'Light Bone' draws inspiration from Lorenzo's favorite silhouette, the Air Raid outdoor basketball shoe first introduced in 1992. Incorporating the same distinct cross straps into the Light Bone upper, a contrasting black Swoosh stands out along with the visible double-stacked Zoom Air units. Modern design lines combine with premium comfort to define this lifestyle shoe.",
      sku: "AT8087 001",
      release_date: "27/04/2019",
      colorway: "Light Bone/Black/Sail",
      brand: "Nike",
      silhouette: "Air Fear Of God Raid",
      technology: "Air",
      designer: "Jerry Lorenzo" 
    },
    {
      name: "Fear Of God x Air Skylon 2 'Black'",
      description: "Nike teamed up with Fear of God’s Jerry Lorenzo to released an updated iteration of the Skylon 2 silhouette. The Fear Of God x Air Skylon 2 'Black' features a mesh-based upper in an all-black color scheme with matching leather and patent leather details. The low top also boasts mesh padding on the tongue for breathability, a toggle lacing system for a personalized fit, and Fear of God branding on the heel side and insole.",
      sku: "BQ2752 001",
      release_date: "27/12/2018",
      colorway: "Black/Anthracite-White",
      brand: "Nike",
      silhouette: "Air Skylon 2",
      technology: "Air",
      designer: "Jerry Lorenzo" 
    },
    {
      name: "Fear Of God x Air Skylon 2 'Light Bone'",
      description: "Famed creative Jerry Lorenzo collaborated with Nike in 2018 to develop the Fear of God collection. The Air Skylon 2 'Light Bone' dropped in July 2019, featuring a luxe makeover to the vintage running silhouette with a mesh and suede upper. Adding metallic accents and transparent detailing, the shoe incorporates performance with an ethereal feel.",
      sku: "BQ2752 003",
      release_date: "20/07/2019",
      colorway: "Light Bone/Clear-Reflect",
      brand: "Nike",
      silhouette: "Air Skylon 2",
      technology: "Air",
      designer: "Jerry Lorenzo" 
    },
    {
      name: "Air Fear Of God Shootaround 'Black'",
      description: "The Air Fear of God SA ‘Black’ is a lifestyle take on Jerry Lorenzo’s performance-focused Nike collaboration, the Fear of God 1. The two silhouettes share the same extended collar and double-height Zoom Air unit. Featuring an all-black synthetic upper, the Shoot Around ditches the cage construction of its counterpart, while adding an ankle strap, drawcord lacing and a glossy Swoosh on the quarter panel.",
      sku: "AT9915 001",
      release_date: "15/12/2018",
      colorway: "Black/Black",
      brand: "Nike",
      silhouette: "Air Fear Of God SA",
      technology: "Air",
      designer: "Jerry Lorenzo" 
    },
    {
      name: "Air Fear Of God Shootaround 'Light Bone'",
      description: "The Air Fear of God SA ‘Light Bone' showcases Jerry Lorenzo’s take on a lifestyle basketball sneaker. The high-top is the off-court version of the similar Fear of God 1, down to the colorway, heel zip detailing and double-height Zoom Air unit. Unlike its performance counterpart, the Shoot Around features a cageless one-piece upper adorned with a Swoosh and adjustable ankle strap.",
      sku: "AT9915 002",
      release_date: "19/01/2019",
      colorway: "Light Bone/Black",
      brand: "Nike",
      silhouette: "Air Fear Of God SA",
      technology: "Air",
      designer: "Jerry Lorenzo" 
    },
  ]

  # Sneaker Factory Method
  fogs.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  fogs.each do |sneaker|
    case sneaker[:name]
    when "Air Fear Of God 1 'Black'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(800, 1100) })
      end 
    when "Air Fear Of God 1 'Light Bone'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(900, 1200) })
      end 
    when "Air Fear Of God Raid 'Black'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(215, 285) })
      end 
    when "Air Fear Of God Raid 'Light Bone'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(240, 300) })
      end 
    when "Fear Of God x Air Skylon 2 'Black'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(120, 180) })
      end 
    when "Fear Of God x Air Skylon 2 'Light Bone'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(160, 215) })
      end 
    when "Air Fear Of God Shootaround 'Black'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(400, 500) })
      end 
    when "Air Fear Of God SA 'Light Bone'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(375, 475) })
      end 
    end
  end

# Sacai

  sacais = [
    {
      name: "Sacai x LDWaffle 'Varsity Blue'",
      description: "Sacai and Nike collaborate again, with the Nike LDWaffle emerging from Paris Fashion Week at the Sacai SP19 runway show. Featuring a unique hybridization technique, the shoe mixes two Nike runners from the archives: the Waffle Daybreak and the LDV. With two shoes coming together, a unique upper features a double Swoosh, double tongue, double heel counter, double eyestay and double laces. It’s set against a blue and red upper that mixes suede, leather and mesh while a sculpted midsole juts out past the heel, adding an extra element of crazy design lines on an already chaotic shoe. The classic waffle outsole brings everything together, while Nike and Sacai branding can be seen on the back heel and insole.",
      sku: "BV0073 400",
      release_date: "30/05/19",
      colorway: "Varsity Blue/Del Sol-Varsity Red",
      brand: "Nike",
      silhouette: "LDWaffle",
      technology: "-",
      designer: "Chitose Abe" 
    },
    {
      name: "Sacai x LDWaffle 'Green Gusto'",
      description: "First spotted during Paris Fashion Week 2019 and part of the Spring 19 lineup, the Sacai x Nike LDWaffle will have everyone seeing double. Inspired by hybridization, the shoe combines the Waffle Daybreak and the LDV, two classic Nikes from the running archive. With two shoes coming together, everything gets doubled. The upper sports a green and yellow mesh, leather and suede combination, with a double Swoosh, double heel counter, double eyestay, double tongue and double laces. An exaggerated sculpted midsole adds another dimension to the shoe, sitting atop the classic Nike waffle outsole. Nike and Sacai branding can be found on the back heel tab as well as the sockliner.",
      sku: "BV0073 300",
      release_date: "30/05/19",
      colorway: "Green Gusto/Varsity Maize-Safety Orange",
      brand: "Nike",
      silhouette: "LDWaffle",
      technology: "-",
      designer: "Chitose Abe" 
    },
    {
      name: "Sacai x LDWaffle 'Black'",
      description: "A hybrid of two iconic Nike runners, the Sacai x LDWaffle is an experimental design typical of the Japanese fashion label's provocative aesthetic. This 'Black' version—revealed in September 2019—is executed in mesh with two-tone suede at the toe, eyestays and counter. The concept of duality is furthered by leather Swooshes, paired tongues and co-branding on the heel. A dual sculpted midsole is layered above a traditional rubber waffle outsole.",
      sku: "BV0073 001",
      release_date: "12/09/2019",
      colorway: "Black/Anthracite-Gunsmoke",
      brand: "Nike",
      silhouette: "LDWaffle",
      technology: "-",
      designer: "Chitose Abe" 
    },
    {
      name: "Sacai x LDWaffle 'Summit White'",
      description: "The Sacai x LDWaffle is a unique collaboration by the Japanese high-fashion label and Nike. A hybrid model that layers two vintage running shoes, this 'Summit White' iteration—emerged in September 2019—is designed with a mesh base, double suede panels and coupled Swooshes. The concept is extended to twin tongues and optional double laces. Following the same formula, two sole units are stacked on top of one another.",
      sku: "BV0073 100",
      release_date: "12/09/2019",
      colorway: "Summit White/Wolf Grey-Black ",
      brand: "Nike",
      silhouette: "LDWaffle",
      technology: "-",
      designer: "Chitose Abe" 
    },
    {
      name: "Sacai x Blazer Mid 'Black Blue'",
      description: "Previewed at Paris Fashion Week during Sacai's Spring 2019 show, the Sacai x Blazer High 'Black Blue' sneaker fuses Nike’s iconic heritage with Sacai’s unique style. Inspired by hybridization, this release combines elements from the Nike Blazer as well as the Dunk High, whose influence can be seen in the wavy eye stay panel. The shoe features a leather upper that doubles up on key elements, resulting in layered tongues, laces, Swooshes and a high autoclave construction that becomes exaggerated at the heel.",
      sku: "BV0072 001",
      release_date: "30/05/2019",
      colorway: "Black/University Blue-Sail",
      brand: "Nike",
      silhouette: "Blazer",
      technology: "-",
      designer: "Chitose Abe" 
    },
    {
      name: "Sacai x Blazer Mid 'Maize Navy'",
      description: "Acclaimed Japanese fashion brand Sacai joined forces with Nike to create the Sacai x Blazer Mid 'Maize Navy' sneaker, released in May 2019. Inspired by hybridization, this shoe blends two retro basketball silhouettes, the ‘72 Blazer and the ’85 Dunk, to create a hybrid that’s both uncommon and familiar. This leather sneaker was designed with twice as many tongues, laces, eye stays, and Swooshes as the typical Blazer Mid. The shoe’s autoclave rubber creeps up the sides and is layered high at the heel for extra protection and style.",
      sku: "BV0072 700",
      release_date: "30/05/2019",
      colorway: "Varsity Maize/Midnight Navy-White",
      brand: "Nike",
      silhouette: "Blazer",
      technology: "-",
      designer: "Chitose Abe" 
    }
  ]

  # Sneaker Factory Method
  sacais.map! { |sneaker| Sneaker.create(sneaker) }

  # Listing Factory Method
  sacais.each do |sneaker|
    case sneaker[:name]
    when "Sacai x LDWaffle 'Varsity Blue'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(525, 750) })
      end 
    when "Sacai x LDWaffle 'Green Gusto'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(500, 750) })
      end 
    when "Sacai x LDWaffle 'Black'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(450, 700) })
      end 
    when "Sacai x LDWaffle 'Summit White'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(450, 650) })
      end 
    when "Sacai x Blazer Mid 'Black Blue'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(275, 425) })
      end 
    when "Sacai x Blazer Mid 'Maize Navy'"
      main_size_run.each do |size|
        Listing.create({ sneaker_id: sneaker[:id], size: size, price: price_setter(225, 325) })
      end
    end
  end

# Photo Mapping to Sneakers
Sneaker.all.each do |sneaker|
  joined_sku = sneaker[:sku].split(" ").join("")
  photo = open("https://ibex-io.s3-us-west-1.amazonaws.com/#{joined_sku}.jpeg")

  sneaker.photo.attach(
    io: photo, 
    filename: "#{joined_sku}.jpeg"
  )
end