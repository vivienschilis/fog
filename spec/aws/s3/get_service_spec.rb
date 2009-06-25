require File.dirname(__FILE__) + '/../../spec_helper'

describe 'S3.get_service' do

  before(:all) do
    s3.put_bucket('foggetservice')
  end

  after(:all) do
    s3.delete_bucket('foggetservice')
  end

  it 'should return proper_attributes' do
    p 'SHOULD CHECK FOR PROPER ATTRIBUTES'
    actual = s3.get_service
    actual.status.should == 200
    p actual
  end

  it 'should include foggetservice in get_service' do
    lambda { s3.get_service }.should eventually { |expected| expected.body[:buckets].collect { |bucket| bucket[:name] }.should include('foggetservice') }
  end

end
