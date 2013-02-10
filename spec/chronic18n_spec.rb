require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Chronic18n" do

  it "should exists" do
    Chronic18n.should be_a Module
  end

  it "should raise error if it doesn't parle x" do
    expect { Chronic18n.parse("cras nox noctis", :la) }.to raise_error(Chronic18n::UnknownLanguage)
  end

  it "should allow options for Chronic" do
    next_month = Time.now + 3600 * 24 * 30
    # "#{next_month.strftime("%b %d")}" -> "Feb 11"
    Chronic18n.parse("#{next_month.strftime("%b %d")}", "en", :context => :future).year.should == Time.now.year
    Chronic18n.parse("#{next_month.strftime("%b %d")}", "en", :context => :past).year.should == Time.now.year - 1
  end
end
