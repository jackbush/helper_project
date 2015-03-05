class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new
      
      if user.admin?
        can :manage, :all
      end

      can [:profile], User
      can [:index, :dashboard], Welcome

      can [:index, :show, :new, :create], Job
      can [:edit, :update, :destroy], Job, poster_id: user.id

      can [:index, :show, :new, :create], Bid
      can [:edit, :update, :destroy], Bid, applicant_id: user.id
    
  end
end
