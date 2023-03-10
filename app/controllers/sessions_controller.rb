class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :googlelogintype, :googlecreate]

  def new
  end

  def googlelogintype

  end

  def googlecreate
      if session[:type] == "applicant"
        puts params[:whoami]
    @applicant = Applicant.find_or_create_from_auth_hash(request.env["omniauth.auth"])
    session[:applicant_id] = @applicant.id
      elsif session[:type] == "agent"
        @agent = Agent.find_or_create_from_auth_hash(request.env["omniauth.auth"])
        session[:agent_id] = @agent.id
      end
    redirect_to root_url
  end

  def create
    if(params[:Gbtn].to_s == "Google Login")
      if params[:whoami] == "applicant"
        puts "googlesneha"
        session[:type] = "applicant"
        puts session[:type].to_s
        redirect_to logingoogle_url
      elsif params[:whoami] == "agent"
        puts "agentsneha"
        session[:type] = "agent"
        puts session[:type].to_s
        redirect_to logingoogle_url
      elsif params[:whoami] == "admin"
        redirect_to login_url, alert: "Admins cannot login through google"
      end
    elsif
    if params[:whoami] == "applicant"
      applicant = Applicant.find_by_email(params[:email])
      if applicant && applicant.authenticate(params[:password])
        session[:applicant_id] = applicant.id
        redirect_to root_url
      else
        redirect_to login_url, alert: "Wrong email or password"
      end
    elsif params[:whoami] == "agent"
      agent = Agent.find_by_email(params[:email])
      if agent && agent.authenticate(params[:password])
        session[:agent_id] = agent.id
        redirect_to root_url
      else
        redirect_to login_url, alert: "Wrong email or password"
      end
    elsif params[:whoami] == "admin"
      admin = Admin.find_by_email(params[:email])
      if admin && admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to root_url
      else
        redirect_to login_url, alert: "Wrong email or password"
      end
    else
      redirect_to login_url, alert: "Choose one from admin, agent or applicant"
    end
    end
  end

  def login
  end

  def welcome
  end

  def destroy
    session[:applicant_id] = nil
    session[:agent_id] = nil
    session[:admin_id] = nil
    redirect_to root_url
  end
end
