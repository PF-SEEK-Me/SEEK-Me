module ApplicationHelper
  def full_name(user)
    user.last_name + " " + user.first_name
  end

  def full_name_kana(user)
    user.last_name_kana + " " + user.first_name_kana
  end

  def id_created_at(id)
    id.created_at.strftime("%Y-%m-%d %H:%M")
  end
end
