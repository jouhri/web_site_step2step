class UsersController < ApplicationController
public
  def webs_sign_in
    respond_to do |format|
      if (User.where(:email => params[:email]).first.valid_password?(params[:password]))
        format.json {render json: User.where(:email => params[:email]).first}
      else
        format.json {render json: '{"error":"Account doesn\'t exist"}'}
      end
    end
  end
 
  def webs_add_training
    respond_to do |format|
      if (User.where(:email => params[:email]).first.valid_password?(params[:password]))
        u = User.where(:email => params[:email]).first
        t = Training.new
        t.distance = params[:distance]
        t.calories = params[:calories]
        t.user_id = u.id
        t.save
        format.json {render json: u.trainings.find(t.id)}
      else
        format.json {render json: '{"error":"Account doesn\'t exist"}'}
      end
    end
  end

  def helloworld
    respond_to do |format|
      if (User.where(:email => params[:email]).first)
        format.json {render json: User.where(:email => params[:email]).first}
      else
        format.json {render json: '{"error":"Account doesn\'t exist"}}'}
      end
    end
  end

  
end
