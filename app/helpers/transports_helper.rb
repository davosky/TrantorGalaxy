module TransportsHelper
  def page_transport
    if current_page?(action: "new")
      "transport/new-transport-logo.svg"
    elsif current_page?(action: "edit")
      "transport/edit-transport-logo.svg"
    else
      "transport/show-transport-logo.svg"
    end
  end

  def page_title_transport
    if current_page?(action: "new")
      "Crea un Nuovo Trasporto"
    elsif current_page?(action: "edit")
      "Modifica il Trasporto"
    else
      "Trasporto"
    end
  end
end
