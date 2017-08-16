# Harmony
Harmony is an effortless tool to track musical events and set lists. Using harmony, organizers can just snap a picture of set lists with their phone, and our technology will automatically sync the event's information with the SOCAN API and our own state-of-the-art dashboard.

<p align="center">
  <img src="https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_photos/000/488/404/datas/gallery.jpg"/>	
</p>

# Inspiration
The problem is that keeping track of performances is complicated and expensive. This is especially true for companies such as SOCAN which only recently became digitized. We set out to change this by building harmony - a simple tool for tracking events. Just download our app, take a picture, and you’re done. We’ll automatically handle the rest.

# The Solution
We built a full featured mobile application that automatically syncs with the SOCAN api and an online dashboard, alerting SOCAN representatives of live events in minutes. Users only have to fill out a form and take a picture to submit an event.

# Market
The music royalty and production market is over $5 billion dollars - by reaching out to nonprofits like SOCAN as well as commercial producers, we can both revolutionize the music industry and turn a profit.

# API

## Account ID
POST to: '/events' (returns json: {id: n} )
params {
  marie_id: ‘777777777’
}

## Venue Information
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

## Promoter Information
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

## PERFORMING Composer
POST to: '/events/:id/composers' 
params {
  name: ‘Lorde’
}

## Song
POST to: '/events/:id/songs' 
params {
  title: ‘Tennis Court’
  artist: ‘Lorde’
}

## Location
POST to: '/events/:id/location' 
params {
  location: ‘37.791821,-122.394679’
}

## Setlist Picture + File Name
POST to: '/events/:id/setlist'
params {
	file: [a picture?]
	fileName: ‘shelby.png’
}
