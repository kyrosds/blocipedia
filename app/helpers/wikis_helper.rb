module WikisHelper
  def is_user_collaborator?(id, collaborators)
    collaborators.find { |user| user[:id] == id }
  end
end
