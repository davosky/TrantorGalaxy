module VehiclesHelper
  def page_vehicle
    if current_page?(action: "new")
      "vehicle/new-vehicle-logo.svg"
    elsif current_page?(action: "edit")
      "vehicle/edit-vehicle-logo.svg"
    else
      "vehicle/show-vehicle-logo.svg"
    end
  end

  def page_title_vehicle
    if current_page?(action: "new")
      "Crea un Nuovo Veicolo"
    elsif current_page?(action: "edit")
      "Modifica il Veicolo con targa:&emsp;<span class='fs-3 fw-bold text-warning'>#{@vehicle.licence_plate}</span>".html_safe
    else
      "Veicolo"
    end
  end
end
