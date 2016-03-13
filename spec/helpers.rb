module Helpers
  def analyzed_log
    [{:time=>
      {:new=>"2000-03-06T17:45:10Z",
       :info=>"2000-03-06T17:45:10Z",
       :starting=>"2000-03-06T17:45:10Z",
       :delivery=>"2000-03-06T17:45:11Z",
       :end=>"2000-03-06T17:45:11Z"},
       :bytes=>"2343",
       :from=>"dave@sill.org",
       :qp=>"18695",
       :uid=>"49491",
       :delivery_id=>"2392",
       :region=>"remote",
       :to=>"lwq@w3.to",
       :status=>
      "success: 209.85.127.177_accepted_message. /Remote_host_said:_250_CAA01516_Message_accepted_for_delivery/",
        :queue_id=>"93869"},
        {:time=>
         {:new=>"2008-09-07T15:09:26Z",
          :info=>"2008-09-07T15:09:26Z",
          :starting=>"2008-09-07T15:09:26Z",
          :delivery=>"2008-09-07T15:09:27Z",
          :end=>"2008-09-07T15:09:27Z"},
          :bytes=>"2343",
          :from=>"dave@sill.org",
          :qp=>"18695",
          :uid=>"49491",
          :delivery_id=>"2392",
          :region=>"remote",
          :to=>"lwq@w3.to",
          :status=>
         "success: 209.85.127.177_accepted_message. /Remote_host_said:_250_CAA01516_Message_accepted_for_delivery/",
           :queue_id=>"869"}]
  end

  def new_log
    '@4000000038c3eeb027f41c7c new msg 93869'
  end

  def info_log
    '@4000000038c3eeb027f6b0a4 info msg 93869: bytes 2343 from <dave@sill.org> qp 18695 uid 49491'
  end

  def starting_log
    '@4000000038c3eeb02877ee94 starting delivery 2392: msg 93869 to remote lwq@w3.to'
  end

  def delivery_log
    '@4000000038c3eeb104a13804 delivery 2392: success: 209.85.127.177_accepted_message. /Remote_host_said:_250_CAA01516_Message_accepted_for_delivery/'
  end

  def end_log
    '@4000000038c3eeb104a6ecf4 end msg 93869'
  end
end
