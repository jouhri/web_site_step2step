class UsersController < ApplicationController

public
  def compare
    @test = true
#    begin
      #fill in the Hash with the average/total results for the user 1
      query1 = User.find(params[:id])
      
      @user1 = {}
      puts "----------------------------------->>> {1}"
      @user1[:distance] = query1.trainings.sum('distance').round(2)
      puts "----------------------------------->>> {2}"
      @user1[:calories] = query1.trainings.sum('calories').round(2)
      puts "----------------------------------->>> {3}"
      @user1[:speed] = query1.trainings.average('speed').round(2)
      puts "----------------------------------->>> {4}"
      @user1[:email] = query1.email
      puts "----------------------------------->>> {5}"
      #fill in the Hash with the average/total results for the user 2
      query2 = User.find_by_email(params[:email])
      puts "----------------------------------->>> {6}"
      @user2 = {}
      @user2[:distance] = query2.trainings.sum('distance').round(2)
      puts "----------------------------------->>> {7}"
      @user2[:calories] = query2.trainings.sum('calories').round(2)
      puts "----------------------------------->>> {8}"
      @user2[:speed] = query2.trainings.average('speed').round(2)
      puts "----------------------------------->>> {9}"
      @user2[:email] = query2.email
      puts "----------------------------------->>> {10}"
#    rescue
#      @test = false
#    end
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
