# Shadow Falls Campground

This is the project for Shadow Falls LGBTQ campground, located in Harrison Mills, BC

## Experiencing this project

This repository is a re-architecture of the current production repository, which can be [viewed here](https://github.com/justin-m-morgan/shadowfalls).

This project can be run locally by cloning this repository to your local machine (configured with Elixir/Erlang and Node) by cloning this repo and running `mix phx.server` in the root of the project.


## Technologies Used 

![Elixir](https://img.shields.io/badge/elixir-%234B275F.svg?style=for-the-badge&logo=elixir&logoColor=white)
![SurfaceUI](https://img.shields.io/badge/surface_UI-%232984D3.svg?style=for-the-badge&logo=elixir&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white)

## Architecture

### Components

This project is built with a component based architecture leveraging [Phoenix LiveView](https://hexdocs/phoenix_live_view) and [SurfaceUI](https://surface-ui.org). 

### Contexts/Domains

Phoenix encourages code organization by "contexts", distinct from the UI layer of the application. This encourages decoupling of data (contexts) from application logic (components/controllers).

## Application Concerns

Shadow Falls Campground is a campground that services the LGBTQ community. Through its website, it offers bookings for overnight tenting and RV visits, day-visits, and seasonal RV-site rentals. Additionally, it serves as a portal for sending general purpose/inquiry messages to the operators.

## Booking Service

The primary functionality of the site is to facilitate short-term bookings (RV and tenting). Historically, both of these types of bookings have shared the following set of necessary information:

- Name of person booking
- Email
- Date of Arrival
- Date of Departure
- Number of people included in booking

Tenting bookings have required a few items of unique information:

- Number of tents included in booking
- Power (on site) requested

And RV bookings have required the following information:

- Type of Unit (RV/Trailer/Fifth-Wheel/Camper)
- Length of Unit
- Whether sewer connection is required?

Additionally, we have requested extra administrative questions which are not essential to the booking:

- Whether the party will have dogs?
- Whether all attendees will be of the minimum age?
- Whether the party is aware that it is an LGBTQ campground?
- (New this year) Whether all attendees have been COVID-vaccinated (and consent to showing proof)

This data is collected in a form, stored in a database, and from this a confirmation email message is sent to both the person booking and the operators. Historically this has been entirely via email but as part of the roadmap for this re-write we will be implementing a User and Admin Dashboard to view and modify this data.

## Seasonal RV Sites

Shadow Falls has a consistent group of RV sites rented out seasonally. As is, we manage communications with these individuals outside the scope of the website and handle billing via Square. 

## Day Visitors

Day-visits are fairly common but their booking through the website is not deemed essential. We prefer that people notify us in advance, especially as an opportunity to communicate infromation to them (such as COVID protocols and re: event attendance).

We anticipate that initially day visits will be handled without requiring site membershipt but this may change in the future.

## Dashboards

One pain point of the historic system for handling bookings has been the manually-intensive and error-prone strategy of using emails and a pen-and-paper booking system. As such, being able to view reservations in a tailored UI (in contrast with email) will be an extreme benefit. 

Additionally, we hope to implement a "scheduling" aspect whereby bookings can be slotted into sites through an administrative dashboard. This would have the feature of identifying conflicts and ensuring accuracy of booking dates--two qualities that the current system consistently bite the operator.

A nice-to-have feature will be the opportunity for those booking to interface with our platform without the need for email. This will include booking-tied conversation threads, booking change requests, online billing, and SMS notifications.

## Roadmap 

- [ ] Static Content
  - [ ] Where we are
  - [ ] What's on the property
  - [ ] What kind of sites we have
  - [ ] What services we offer
  - [ ] What events we host
  - [ ] Secondary
    - [ ] About us
    - [ ] Directions
- [ ] Booking Form
  - [ ] RV
  - [ ] Tenting
  - [ ] People Associations
- [ ] Day Visitor Form
- [ ] User Dashboard
  - [ ] View Own Bookings
  - [ ] Modify Own Bookings
  - [ ] Cancel Own Bookings
- [ ] Photo Gallery
  - [ ] Operator supplied
  - [ ] User supplied
- [ ] Admin Dashboard
  - [ ] View All Bookings
  - [ ] View Time-Window Bookings
  - [ ] Assign Sites
  - [ ] Generate Response Messages 
  - [ ] Modify Bookings
- [ ] General Inquiry Submissions
- [ ] Seasonal RV Dashboard
  - [ ] Billing
  - [ ] Communications (Group)
  - [ ] Communications (Individual) 