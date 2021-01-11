class RequestslistController < ApplicationController
  def indexlist
    @requests = Request.all
    #refresh
  end

  def requestsdetails
    @requests = Request.all
  end

  #Method initialement pour création de job, initialisé dans indexlist par defaut (job ne fonctionnant pas)

    def self.refresh
      @requests = Request.all
      @requests.each do |request| #Pour chaque request
        if request.confirmed_at != nil                 #Si le request est sur la waitinglist(aka confirmed)
          if request.confirmed_at < Date.current-3.month && request.expired == false# ET que sa confirmation remonte a + de 3 mois
            request.update(expired: true)
            if request.reminder == false             # ET qu'il n'a pas recu un rappel par email
              ReminderMailer.reminder_mail(request).deliver_now
              request.update(reminder: true)
            end
          else
            request.expired = false
          end
        end
      end
    end

end
