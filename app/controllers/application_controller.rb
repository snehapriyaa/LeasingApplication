class ApplicationController < ActionController::Base
  helper_method :current_applicant
  helper_method  :current_agent
  helper_method  :current_admin
  before_action :authorized
  helper_method :logged_in?
  helper_method :view_applicant

  def current_applicant
    if session[:applicant_id]
      @current_applicant ||= Applicant.find(session[:applicant_id])
    else
      @current_applicant = nil
    end
  end

  def current_agent
    if session[:agent_id]
      @current_agent ||=Agent.find(session[:agent_id])
    else
      @current_agent = nil
    end
  end

  def current_admin
    if session[:admin_id]
      @current_admin ||=Admin.find(session[:admin_id])
    else
      @current_admin = nil
    end
  end

  def logged_in?
    !current_applicant.nil?||!current_agent.nil?||!current_admin.nil?
  end


  def view_applicant
    redirect_to root_path unless logged_in?
  end

  def view_agent
    valid_agent = false
    if( current_agent)
      if(current_agent.id.to_i==params[:id].to_i)
        valid_agent = true
      end
    end
    redirect_to root_path unless (!current_admin.nil?||valid_agent)
  end

  def view_application
    valid_application = false
    if( current_applicant&&params[:id]!=nil)
      if(Request.find(params[:id].to_i)[:applicant_id].to_i==current_applicant.to_i)
        valid_application = true
      end
    end
    redirect_to root_path unless (!current_admin.nil?||!current_agent.nil?||valid_application)
  end

  def authorized
    redirect_to root_path unless logged_in?
  end

end