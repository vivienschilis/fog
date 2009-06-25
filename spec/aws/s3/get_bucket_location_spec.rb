require File.dirname(__FILE__) + '/../../spec_helper'

describe 'S3.get_location' do

  before(:all) do
    s3.put_bucket('foggetlocation')
  end

  after(:all) do
    s3.delete_bucket('foggetlocation')
  end

  it 'should return proper attributes' do
    p 'SHOULD CHECK FOR PROPER ATTRIBUTES'
    actual = s3.get_bucket('foggetbucket')
    actual.status.should == 200
    p actual
  end

  it 'should return proper attributes' do
    p 'SHOULD CHECK FOR PROPER ATTRIBUTES'
    actual s3.get_location('foggetlocation')
  end

end