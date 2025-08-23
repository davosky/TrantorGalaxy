module ReimbursementClosuresHelper
  def page_reimbursement_closure
    if current_page?(action: "new")
      "reimbursement_closure/new-reimbursement_closure-logo.svg"
    elsif current_page?(action: "edit")
      "reimbursement_closure/edit-reimbursement_closure-logo.svg"
    else
      "reimbursement_closure/show-reimbursement_closure-logo.svg"
    end
  end

  def page_title_reimbursement_closure
    if current_page?(action: "new")
      "Crea una Nuova Chiusura Rimborsi"
    elsif current_page?(action: "edit")
      "Modifica ls Chiusura Rimborsi"
    else
      "Chiusura Rimborsi"
    end
  end

  def payed(reimbursement_closure)
    if reimbursement_closure.payment == true
      "<i class='fa-solid fa-square-check text-success fs-3 fw-bold'></i>".html_safe
    else
      "<i class='fa-solid fa-square-xmark text-warning fs-3 fw-bold'></i>".html_safe
    end
  end
end
