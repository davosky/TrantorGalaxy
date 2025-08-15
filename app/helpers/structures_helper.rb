module StructuresHelper
  def page_structure
    if current_page?(action: "new")
      "structure/new-structure-logo.svg"
    elsif current_page?(action: "edit")
      "structure/edit-structure-logo.svg"
    else
      "structure/show-structure-logo.svg"
    end
  end

  def page_title_structure
    if current_page?(action: "new")
      "Crea una Nuova Struttura"
    elsif current_page?(action: "edit")
      "Modifica la Struttura"
    else
      "Struttura"
    end
  end
end
