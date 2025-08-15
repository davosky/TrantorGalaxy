module ReasonsHelper
  def page_reason
    if current_page?(action: "new")
      "reason/new-reason-logo.svg"
    elsif current_page?(action: "edit")
      "reason/edit-reason-logo.svg"
    else
      "reason/show-reason-logo.svg"
    end
  end

  def page_title_reason
    if current_page?(action: "new")
      "Crea un Nuovo Motivo Missione"
    elsif current_page?(action: "edit")
      "Modifica il Motivo Missione"
    else
      "Motivo Missione"
    end
  end
end
