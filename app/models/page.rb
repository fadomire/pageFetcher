require 'open-uri'

class Page < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  attr_accessible :page_id
  validates_uniqueness_of :page_id
  validates_presence_of :page_id
  validates_presence_of :name, :message => "not found, try another ?"

  def self.getFacebookFeeds(page_id)
  	# Define facebook API token to get access to wall messages
    access_token = 'AAADFZAIL8xY8BABtj6QNNxqcVt67XZADyqWClxDxZCYK95416pAKs6FhLLhZBEVceBzreoEmZA8e8zmNjXNdBDY2K5x6vixYZD'

    # Request wall message from facebook API for the given page_id and catch any errors
    begin
      JSON.parse(open('https://graph.facebook.com/'+page_id+'/feed?access_token='+access_token+'&limit=10').read)
    rescue
      ''
    end
  end

  def self.getFacebookPage(page_id)
  	# Request page infos from facebook API for the given page_id or page username and catch any errors
    begin
      JSON.parse(open('http://graph.facebook.com/'+page_id).read)
    rescue
      ''
    end
  end
end
