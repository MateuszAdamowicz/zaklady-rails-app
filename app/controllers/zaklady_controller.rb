class ZakladyController < ApplicationController
  def nowy
    if params[:Zaklady] and params[:Wydarzenie]
    	s = params[:Zaklady].to_s.split("\n")

      @event = Event.new({:name => params[:Wydarzenie], :status => 0})
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
    		  
          @zaklad = Zaklad.new({:data => data_2, :gosc => gosc.sub("na żywo",""), :gospodarz => gospodarz, :k1 => kursy[0], :k2 => kursy[1], :k3 => kursy[2], :event_id => @event.id})
          @zaklad.save
        end
    	end
    end
  end

  def wynik
    if params[:Wynik] and params[:Event]
      wyniki = params[:Wynik].split("\n")
      event = Event.find(params[:Event])
      i = 0
      event.zaklads.sort_by{|x| x.data}.each do |zaklad|
        zaklad.wynik = wyniki[i].to_i
        zaklad.save
        kursy = [zaklad.k1, zaklad.k2, zaklad.k3]
        zaklad.obstawienies.each  do |obstawienie|
          if zaklad.wynik == obstawienie.opcja
            obstawienie.wygrana = kursy[obstawienie.opcja-1]*obstawienie.reputacja - obstawienie.reputacja
          else
            obstawienie.wygrana = -obstawienie.reputacja
          end
          obstawienie.save
        end
        i += 1
      end

      if event.zaklads.select { |x| x.wynik }.length == event.zaklads.length
        event.status = 2
        event.save
      end
    end
  end
end
