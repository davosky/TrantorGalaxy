module RoadsHelper
  def page_road
    if current_page?(action: "new")
      "road/new-road-logo.svg"
    elsif current_page?(action: "edit")
      "road/edit-road-logo.svg"
    else
      "road/show-road-logo.svg"
    end
  end

  def page_title_road
    if current_page?(action: "new")
      "Crea un Nuovo Percorso"
    elsif current_page?(action: "edit")
      "Modifica il Percorso"
    else
      "Percorso"
    end
  end
end
