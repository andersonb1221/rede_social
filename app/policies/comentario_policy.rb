class ComentarioPolicy < ApplicationPolicy

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    user.id == record.user.id
  end

end
