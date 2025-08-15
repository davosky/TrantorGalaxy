module PlacesHelper
  def page_place
    if current_page?(action: "new")
      "place/new-place-logo.svg"
    elsif current_page?(action: "edit")
      "place/edit-place-logo.svg"
    else
      "place/show-place-logo.svg"
    end
  end

  def page_title_place
    if current_page?(action: "new")
      "Crea un Nuovo Luogo"
    elsif current_page?(action: "edit")
      "Modifica il Luogo"
    else
      "Luogo"
    end
  end
end
