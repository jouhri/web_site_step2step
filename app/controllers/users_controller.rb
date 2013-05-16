class UsersController < ApplicationController
private
  def get_results
    
  end

public
  def compare
    @test = true
    begin
      #fill in the Hash with the average/total results for the user 1
      @user1 = {}
      @user1[:distance] = User.find(params[:id]).trainings.sum('distance').round(2)
      @user1[:calories] = User.find(params[:id]).trainings.sum('calories').round(2)
      @user1[:speed] = User.find(params[:id]).trainings.average('speed').round(2)
      @user1[:email] = User.find(params[:id]).email

      #fill in the Hash with the average/total results for the user 2
      @user2 = {}
      @user2[:distance] = User.find_by_email(params[:email]).
        trainings.sum('distance').round(2)
      @user2[:calories] = User.find_by_email(params[:email]).
                                trainings.sum('calories').round(2)
      @user2[:speed] = User.find_by_email(params[:email]).
        trainings.average('speed').round(2)
      @user2[:email] = User.find_by_email(params[:email]).email
      
    rescue
      @test = false
    end
    respond_to do |format|
      if @test == true
        format.html
      else
        format.html {render :template => "home/index.html.erb"}
      end
    end
  end

  def show
    @test = true
    begin
      @user = User.find(params[:id])
    rescue Exception => e
      @test = false
    end
    respond_to do |format|
      if @test == true
        format.html
      else
        format.html {render :template => 'home/index.html.erb'}
      end
    end
  end
 
  def webs_add_training
    respond_to do |format|
      if (User.where(:email => params[:email]).first.valid_password?(params[:password]))
        u = User.where(:email => params[:email]).first
        t = Training.new(:distance => params[:distance],
                         :calories => params[:calories],
                         :speed => params[:speed],
                         :title => params[:title], :user_id => u.id)
        t.save
        
        format.json {render json: '{"success":"sa rocks"}'}
      else
        format.json {render json: '{"error":"Account doesn\'t exist"}'}
      end
    end
  end
  
end
