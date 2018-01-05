class Api::V1::EventsController < Api::V1::BaseController
  
  def index
    events = Event.where(event_params)
    render :json => events.as_json
  end

  def create
    event = Event.new(event_params)

    if event.save
      render :json => event.as_json
    else
      render :json => event.errors.as_json
    end
  end

  def update
    event = Event.find(params[:id])

    if event.update(event_params)
      render :json => event.as_json
    else
      render :json => event.errors.as_json
    end
  end

  def destroy
    event = Event.find(params[:id])

    if event.destroy
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end
  end

  def add_participant
    event = Event.find(params[:id])
    user  = User.find(params[:user_id])

    event.users << user

    if event.save
      render :json => { :success => true }
    else
      render :json => { :success => false, :message => event.errors.as_json}
    end
  end

  def remove_participant
    event = Event.find(params[:id])
    user  = User.find(params[:user_id])

    event.users.delete(user)

    if event.save
      render :json => { :success => true }
    else
      render :json => { :success => false, :message => event.errors.as_json}
    end
  end

  def start_event

  end

  def end_event

  end

  private

  def event_params
    params.permit(:id, :name, :socket, :winner, :status, :creator_id)
  end
end
