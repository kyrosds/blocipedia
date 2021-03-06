class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user && user.role == 'admin'
        wikis = scope.all
      elsif user && user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private? || wiki.user == user || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if wiki.private? || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end

  def new?
    @user
  end

  def edit?
    user_is_owner_of_record?
  end

  def destroy?
    user_is_owner_of_record?
  end

  private

  def user_is_owner_of_record?
    false

    if @user
      @user == @record || @user.admin?
    end
  end
end
