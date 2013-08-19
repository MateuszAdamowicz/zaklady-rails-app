class ZakladyController < ApplicationController
  def nowy
  	s = params[:Zaklady].to_s.split("\n")

    @event = Event.new({:name => params[:Wydarzenie]})
    @event.save

  	s.each do |x|
      x = x.split("na żywoWIDEO").join("")
  		x = x.split.join(" ")
  		if x =~ /(.+)\s-\s(.+)\s(\d+.\d+.\d+)\s(\d+:\d+)\s(\d+.\d+)\s(\d+.\d+)\s(\d+.\d+)/
  			gospodarz = "#{$1}"
  			gosc = "#{$2}"
  			data = "#{$3}".split('.')
  			godzina = "#{$4}".split(':')
        data_2 = DateTime.new(2000+data[-1].to_i,data[-2].to_i,data[-3].to_i,godzina[0].to_i,godzina[1].to_i)
  			kursy = ["#{$5}".to_f, "#{$6}".to_f, "#{$7}".to_f]
      
        @zaklad = Zaklad.new({:data => data_2, :gosc => gosc, :gospodarz => gospodarz, :k1 => kursy[0], :k2 => kursy[1], :k3 => kursy[2], :event_id => @event.id})
        @zaklad.save
      elsif x =~ /(.+)\s-\s(.+)\s(\d+.\d+.\d+)\s(\d+:\d+)\s(\d+.\d+)\s(\d+.\d+)/
        gospodarz = "#{$1}"
        gosc = "#{$2}"
        data = "#{$3}".split('.')
        godzina = "#{$4}".split(':')
        data_2 = DateTime.new(2000+data[-1].to_i,data[-2].to_i,data[-3].to_i,godzina[0].to_i,godzina[1].to_i)
        kursy = ["#{$5}".to_f, "0.00".to_f, "#{$6}".to_f]
  		  
        @zaklad = Zaklad.new({:data => data_2, :gosc => gosc, :gospodarz => gospodarz, :k1 => kursy[0], :k2 => kursy[1], :k3 => kursy[2], :event_id => @event.id})
        @zaklad.save
      end
  	end
  end
end
