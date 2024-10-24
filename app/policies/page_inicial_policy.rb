class PageInicialPolicy < ApplicationPolicy

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.id == record.current.id
  end

end
