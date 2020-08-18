class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    user.present?

  end

  def new?
    create?
  end

  def update?
    return true if user.present? && user == article.user

  end

  def edit?
    update?
  end

  def destroy?
    return true if user.present? && user == article.user

  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
  private
 
    def article
      record
    end
end
