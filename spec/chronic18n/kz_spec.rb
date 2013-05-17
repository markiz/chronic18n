# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

HOUR = HOURS = 3600
DAY = DAYS = 86400

def get_time(t)
  Time.at(Time.now + t)
end

describe "Kazakh" do

  it "should parse at least some dates" do
    time = Chronic18n.parse("29 қар 2012", :kz)
    time.day.should eql(29)
    time.month.should eql(11)
    time.year.should eql(2012)
  end

  it "understands dasherized dates" do
    time = Chronic18n.parse("29 - қар - 2012", :kz)
    time.day.should eql(29)
    time.month.should eql(11)
    time.year.should eql(2012)
  end
end
