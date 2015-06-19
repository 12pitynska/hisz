class Ability
  include CanCan::Ability

  def initialize(user)
   # user ||= User.new # guest user
     can :read, [News, Article, Link, Vocabulary, Word, Survey, Theory]
             can [:read, :fromcategory], Link
        can [:read, :fromlevel], Theory
        can [:read, :fromlevel], Article
        can [:read, :fromlevel], Vocabulary

 
   if user != nil

        if user.role.name == "Admin"
          can :manage, [News, Article, Theory, Link, Vocabulary, Word, Image, Level, Category, Role, User, Survey]
          can :manage, [Survey::Survey]
        end
        if user.role.name == "Moderator"
            can :manage, [News, Article, Vocabulary, Word, Link, Theory, Survey]
        end
        if user.role.name == "User"
            can :manage, [Article, Vocabulary, Word, Link, Theory, Survey]
        else


        can :read, [News, Article, Link, Vocabulary, Word, Survey, Theory]
      #  can :read, :level, id: 1
        can [:read, :fromcategory], Link
        can [:read, :fromlevel], Theory
        can [:read, :fromlevel], Article
        can [:read, :fromlevel], Vocabulary



   #  can[:read, :fromlevel], Theory, level_id: id
    #cannot :create, :attempt
        end
  
  end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
