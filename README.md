# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Product
!["Home Page"](https://github.com/Jacob1225/Jungle/blob/master/docs/Product-detail-page.png?raw=true)
!["Product Details Page"](https://github.com/Jacob1225/Jungle/blob/master/docs/Home-page.png?raw=true)
!["Shopping Cart Page"](https://github.com/Jacob1225/Jungle/blob/master/docs/Cart-page.png?raw=true)
!["Admin Products Page"](https://github.com/Jacob1225/Jungle/blob/master/docs/Admin-products.png?raw=true)



## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server
9. Most importantly, have fun using Jungle! 

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
