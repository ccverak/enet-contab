# PppContab

Get accounting information from [Enet] pages. 

This is a re-write of a report utility I wrote a while back based on
hpricot, scruffy, etc.

Currently returns the total time used by each number, and the number of
connections performed. 

Not a big deal, but proved useful for me and my Linux friends (there's a
software in Windows which is almost the defacto standard for this).

## Installation

Add this line to your application's Gemfile:

    gem 'ppp_contab'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ppp_contab

## Usage

`ppp_contab -f <path to downloaded contab>`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[Enet]: http://www.enet.cu
