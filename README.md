## Installation

Add this line to your application's Gemfile:

    gem 'hashifier'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hashifier

## Usage

This it a simple hash conversion gem. Say you have a hash like the following:

    h = {"de.active_admin.any" => 20,"en.active_record.whatever.something" => 40}
	
After converting it, via:

	Hashifier::StringKeyHashExporter.new.export(h)
	
You would get:

    {
       "de" => {"active_admin" => {"any" => 20}},
       "en" => {"active_record" => {"whatever" => {"something" => 40}}}
    } 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
