# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

main_size_run = [ 8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0 ]
full_size_run = [ 4.0, 5.0, 6.0, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0, 13.0, 14.0 ]

# Returns an array of n random sizes that can be used to generate Listings
def size_limiter(sizes, n)
  res = []

  until res.length == num do
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
      name: "Air Jordan 1 Retro High OG 'Gym Red'",
      description: "Giving rise to sneaker culture back in 1985, the Air Jordan 1 Retro High OG represents a paradigm shift in the way that we relate to footwear. This 'Gym Red' reissue—launched in June 2019—remixes an iconic color scheme on its leather upper. Bold lateral Swooshes ignite a sense of sport prestige, while Wings and Jumpman logos reflect hoops heritage. The classic midsole and outsole combination endorses the distinct court inspiration below.",
      sku: "555088 061",
      release_date: "29/06/2019",
      colorway: "Black/White Sail-Gym Red",
      brand: "Air Jordan",
      silhouette: "Air Jordan 1",
      technology: "Air",
      designer: "Peter Moore"
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
      name: "Air Jordan 1 Retro High OG 'Top 3'",
      description: "In 2016, Nike combined three original Air Jordan 1 colorways ('Bred/Banned,' 'Chicago,' and 'Royal') into one new colorway, the Air Jordan 1 Retro High OG ‘Top 3’. The sneaker comes in mismatched' color panels and outsoles while staying true to the original design by featuring the ‘Wings’ logo on the ankle and Nike Air branding on the insole and tongue. ‘Top 3’ also nods to Jordan being drafted third overall in the 1984 NBA Draft.",
      sku: "555088 026",
      release_date: "27/11/2016",
      colorway: "Black/University Red-Royal Blue",
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
      name: "Eric Koston x Air Jordan 1 Low SB 'Midnight Navy'",
      description: "Designed in collaboration with skate legend Eric Koston, this Air Jordan 1 Low gets the Nike SB treatment. The colorway is inspired by a similar AJ1 that dropped in 2001: a Mid-Top version and a Japan-exclusive High-Top version. This 'Midnight Navy' tribute—debuted in June 2019—reworks the icon with suede paneling and Metallic Silver Swooshes. A bright Jumpman logo on the toe box is a nice subtle detail, along with the Zoom Air sockliner for impact protection.",
      sku: "CJ7891 400",
      release_date: "17/06/2019",
      colorway: "Midnight Navy/White-Metallic Silver",
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
    }
  ]

  # Sneaker Factory Method
  jordan_1s.map! { |sneaker| Sneaker.create(sneaker) }