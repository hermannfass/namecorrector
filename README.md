# Namecorrector

## Purpose 

### Why and where to use it

In an environment where the data architecture is well managed you will
hopefully not need this module. When storing names it should be taken care of
that the spelling (including case) is exactly like the name holder spells it.
Turning a name into "flat case" (all-uppercase or all-lowercase) 
usually implies a loss of information. Nevertheless it
has been seen too often that surnames are collected in (or transferred to)
flat case or other incorrect spelling.

This module is supposed to revert this, but note: By the nature of subject
(surnames) it is not a deterministic operation. Two different spellings could
result in the same flat case string. Example: Macaroni or MacAroni?

### What it actually does

Each word starts with an uppercase letter unless it "looks like" a
preposition. Prepositions are for example 'von' (German), 'van den'
(Dutch), 'de la' (French), and others in various languages.

If a typical camel case name (like "DIPASQUALE") is detected, we assume it
should be turned into camel case ("DiPasquale"). But as mentioned above: This
is by definition not a deterministic operation, so don't expect the module to
be able to guess where all the names in the world should have upper case
letters and where they should have lower case characters. It is not possible
to revert data quality ignorance afterwards.

## Requirements

Requires the 'stringextension' Gem.
Get it from the 'pkg' subfolder of:
https://github.com/hermannfass/stringextension/

## Installation

Add this line to your application's Gemfile:

    gem 'namecorrector'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install namecorrector

## Usage

    require 'namecorrector'
    nc = NameCorrector.new
    name = 'DR. Med. ährmann-mccormick VOM Faß'
    puts nc.make_proper_case(name)
    # Result: Dr. med. Ährmann-McCormick vom Faß

## Contributing

1. Fork it ( https://github.com/[my-github-username]/namecorrector/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
