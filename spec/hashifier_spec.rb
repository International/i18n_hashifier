require "spec_helper"

describe Hashifier do
  describe "StringKeyHashExporter" do
    it "should convert a simple hash" do
      # {"de.active_admin.any" => "Some value", "en.active_record.whatever" => 20}
      # =>
      # {"de" => {"active_admin" => {"any" => "Some value"}}}
      h = {"de.active_admin" => 20}
      Hashifier::StringKeyHashExporter.new.export(h).should == {"de" => {"active_admin" => 20}}
    end

    it "should convert keys with more than 2 dots as well" do
      h = {"de.active_admin.any" => 20}
      Hashifier::StringKeyHashExporter.new.export(h).should ==
        {"de" => {"active_admin" => {"any" => 20}}}
    end

    it "should convert multiple keys as well" do
      h = {"de.active_admin.any" => 20,"en.active_record.whatever.zebra" => 40}
      Hashifier::StringKeyHashExporter.new.export(h).should ==
        {
        "de" => {"active_admin" => {"any" => 20}},
        "en" => {"active_record" => {"whatever" => {"zebra" => 40}}}
      }
    end

  end
end
