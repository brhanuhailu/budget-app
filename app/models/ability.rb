class Ability
  included CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can(:read, MyGroups, author_id: user.id)
    can(:read, Expense, author_id: user.id)
    can(:read, User, id: user.id)
  end
end
