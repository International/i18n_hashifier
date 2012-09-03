require "spec_helper"

describe I18nHashifier do
  describe "StringKeyHashExporter" do
    it "should convert a simple hash" do
      # {"de.active_admin.any" => "Some value", "en.active_record.whatever" => 20}
      # =>
      # {"de" => {"active_admin" => {"any" => "Some value"}}}
      h = {"de.active_admin" => 20}
      I18nHashifier::StringKeyHashExporter.new.export(h).should == {"de" => {"active_admin" => 20}}
    end

    it "should convert a simple hash and export keys as symbols" do
      # {"de.active_admin.any" => "Some value", "en.active_record.whatever" => 20}
      # =>
      # {"de" => {"active_admin" => {"any" => "Some value"}}}
      h = {"de.active_admin" => 20}
      I18nHashifier::StringKeyHashExporter.new.export(h,true).should == {:de => {:"active_admin" => 20}}
    end


    it "should convert keys with more than 2 dots as well" do
      h = {"de.active_admin.any" => 20}
      I18nHashifier::StringKeyHashExporter.new.export(h).should ==
        {"de" => {"active_admin" => {"any" => 20}}}
    end

    it "should convert multiple keys as well" do
      h = {"de.active_admin.any" => 20,"en.active_record.whatever.zebra" => 40}
      I18nHashifier::StringKeyHashExporter.new.export(h).should ==
        {
        "de" => {"active_admin" => {"any" => 20}},
        "en" => {"active_record" => {"whatever" => {"zebra" => 40}}}
      }
    end

    it "should handle similar keys" do
      h = {"de.active_admin.any"=>"EAlle", "de.active_admin.cancel"=>"AbbrechenX"}
      I18nHashifier::StringKeyHashExporter.new.export(h).should ==
        {
        "de" => {"active_admin" => {"any" => "EAlle","cancel" => "AbbrechenX"}},
      }

    end

  end
end
