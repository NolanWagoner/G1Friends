class CalendarController < ApplicationController
    def index
        @event = EventsCalendar.all
    end
   
    def show
        @event = EventsCalendar.find(params[:event_id])
    end
    def new
        @event = EventsCalendar.new
    end
    
    def create
        @event = EventsCalendar.new(calendar_params)
        
        if @event.save
            redirect_to calendar_index_url
        else
            render 'new'
        end
    end
    def destroy
        @event = EventsCalendar.find(params[:id])
        @event.destroy
        
        redirect_to calendar_index_path
    end
end

private
    def calendar_params
        params.require(:calendar).permit(:title, :description)
    end
    
   