module ReimbursementsHelper
  def page_reimbursement
    if current_page?(action: "new")
      "reimbursement/new-reimbursement-logo.svg"
    elsif current_page?(action: "edit")
      "reimbursement/edit-reimbursement-logo.svg"
    else
      "reimbursement/show-reimbursement-logo.svg"
    end
  end

  def page_title_reimbursement
    if current_page?(action: "new")
      "Crea un Nuovo Rimborso Spese"
    elsif current_page?(action: "edit")
      "Modifica il Rimborso Spese"
    else
      "Rimborso Spese"
    end
  end

  def used_vehicle(reimbursement)
    if reimbursement.vehicle_id != nil
      ("Ho usato il seguente veicolo: <span class='fs-5 fw-bold'>#{reimbursement.vehicle_fr}</span>.").html_safe
    end
  end

  def departure_gender(reimbursement)
    if reimbursement.user.gender == "M"
      "Sono partito il giorno "
    elsif reimbursement.user.gender == "F"
      "Sono partita il giorno "
    else
      "Sono partit* il giorno "
    end
  end

  def return_gender(reimbursement)
    if reimbursement.user.gender == "M"
      "Sono rientrato in sede il giorno "
    elsif reimbursement.user.gender == "F"
      "Sono rientrata il giorno "
    else
      "Sono rientrat* il giorno "
    end
  end

  def incurred_prking_cost(reimbursement)
    if reimbursement.parking_cost != nil && reimbursement.parking_cost > 0.00
      ("<tr><td class='fs-5 fw-bold'>Parcheggio:</td><td class='fs-5 fw-bold'>#{number_to_currency(reimbursement.parking_cost)}</td></tr>").html_safe
    end
  end

  def incurred_food_cost(reimbursement)
    if reimbursement.food_cost != nil && reimbursement.food_cost > 0.00
      ("<tr><td class='fs-5 fw-bold'>Vitto:</td><td class='fs-5 fw-bold'>#{number_to_currency(reimbursement.food_cost)}</td></tr>").html_safe
    end
  end

  def incurred_room_cost(reimbursement)
    if reimbursement.room_cost != nil && reimbursement.room_cost > 0.00
      ("<tr><td class='fs-5 fw-bold'>Alloggioi:</td><td class='fs-5 fw-bold'>#{number_to_currency(reimbursement.room_cost)}</td></tr>").html_safe
    end
  end

  def incurred_ticket_cost(reimbursement)
    if reimbursement.ticket_cost != nil && reimbursement.ticket_cost > 0.00
      ("<tr><td class='fs-5 fw-bold'>Ticket:</td><td class='fs-5 fw-bold'>#{number_to_currency(reimbursement.ticket_cost)}</td></tr>").html_safe
    end
  end

  def incurred_generic_cost(reimbursement)
    if reimbursement.generic_cost != nil && reimbursement.generic_cost > 0.00
      ("<tr><td class='fs-5 fw-bold'>Varie:</td><td class='fs-5 fw-bold'>#{number_to_currency(reimbursement.generic_cost)}</td></tr>").html_safe
    end
  end

  def incurred_highway_cost(reimbursement)
    if reimbursement.highway_cost_fr != nil && reimbursement.highway_cost_fr > 0.00
      ("<tr><td class='fs-5 fw-bold'>Autostrada:</td><td class='fs-5 fw-bold'>#{number_to_currency(reimbursement.highway_cost_fr)}</td></tr>").html_safe
    end
  end

  def incurred_private_vehicle_cost(reimbursement)
    if reimbursement.transport.name == "Veicolo Privato"
      ("<tr><td class='fs-5 fw-bold'>Costo Totale Percorso:</td><td class='fs-5 fw-bold'>#{number_to_currency(reimbursement.vehicle.cost_per_km * reimbursement.road_lenght_fr)}</td><td class='fs-5 fw-bold text-secondary'>#{number_to_currency(reimbursement.vehicle.cost_per_km)} x #{reimbursement.road_lenght_fr}&nbsp;Km</td></tr>").html_safe
    end
  end

  def conditional_syle_prefilled_forms(reimbursement)
    if reimbursement.reason_id != nil ||
       reimbursement.road_id != nil ||
       reimbursement.place_id != nil ||
       reimbursement.structure_id != nil
      "display:block"
    else
      "display:none"
    end
  end

  def conditional_syle_free_forms(reimbursement)
    if reimbursement.reason_id != nil ||
       reimbursement.road_id != nil ||
       reimbursement.place_id != nil ||
       reimbursement.structure_id != nil
      "display:none"
    elsif reimbursement.reason_fr != nil ||
          reimbursement.road_fr != nil ||
          reimbursement.place_fr != nil ||
          reimbursement.structure_fr != nil
      "display:block"
    else
      "display:none"
    end
  end
end
