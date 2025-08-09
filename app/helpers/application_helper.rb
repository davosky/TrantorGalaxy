module ApplicationHelper
  def full_user
    sanitize("<strong>#{current_user.first_name}&nbsp;#{current_user.last_name}</strong>&emsp;#{current_user.region}&nbsp;#{current_user.province}&emsp;#{current_user.institute}&nbsp;#{current_user.office}&emsp;#{current_user.category}")
  end

  def gender_avatar(current_user)
    if current_user.gender == "M"
      "user/user_avatar_male.svg"
    elsif current_user.gender == "F"
      "user/user_avatar_female.svg"
    else
      "user/user_avatar_unknown.svg"
    end
  end

  def admin
    current_user.admin == true
  end

  def manager
    current_user.manager == true
  end

  def payroll
    current_user.payroll == true
  end

  def regular
    current_user.regular == true
  end
end
