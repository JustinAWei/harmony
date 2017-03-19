FLOW:
  - Account ID (Who are you?)
  - Venue Information (Where are you performing?)
  - Promoter Information (Who’s sponsoring?)
  - Add Performing Composers (Who’s singing?)
  - Add setlist pic ;)
  - Add Songs (Which songs were sung and who wrote them?’)
 
Account ID
POST to: '/events' (returns json: {id: n} )
params {
  marie_id: ‘777777777’
}

Venue Information
POST to:  '/events/:id/venue' 
params {
  type_of_program: ‘sc’
  proof_type: ‘contract’
  venue: ‘SOCAN’
  venuetype: ‘cfs’
  venuecapacity: ‘l5’
  venue_phone: 4164458700’
  venue_website: ‘www.socan.ca’
}

Promoter Information
POST to: '/events/:id/promoter' 
params {
  promoter: ‘SOCAN’
  promoter_street1: ‘41 Valleybrook’
  promoter_city: ‘Toronto’
  promoter_province: ‘ON’
  promoter_postal_code: ‘M3B2S6’
  promoter_country: ‘CAN’
  promoter_telephone: ‘4164458700’
}

Add PERFORMING Composer
POST to: '/events/:id/composers' 
params {
  name: ‘Lorde’
}

Add Song
POST to: '/events/:id/songs' 
params {
  title: ‘Tennis Court’
  artist: ‘Lorde’
}

Add Location
POST to: '/events/:id/location' 
params {
  location: ‘37.791821,-122.394679’
}

Add Setlist Picture + File Name
POST to: '/events/:id/setlist'
params {
	file: [a picture?]
	fileName: ‘shelby.png’
}
