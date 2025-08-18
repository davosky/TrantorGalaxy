RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.asset_source = :sprockets

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin == true
  end

  config.main_app_name = ["Trantor Galaxy"]

  config.model "User" do
    visible true
    label "Utente"
    label_plural "Utenti"
  end

  config.model "Vehicle" do
    visible true
    label "Veicolo"
    label_plural "Veicoli"
  end

  config.model "Transport" do
    visible true
    label "Trasporto"
    label_plural "Trasporti"
  end

  config.model "Road" do
    visible true
    label "Percorso"
    label_plural "Percorsi"
  end

  config.model "Place" do
    visible true
    label "Luogo"
    label_plural "Luoghi"
  end

  config.model "Structure" do
    visible true
    label "Struttura"
    label_plural "Strutture"
  end

  config.model "Reason" do
    visible true
    label "Motivo Missione"
    label_plural "Motivi Missione"
  end

  config.model "Reimbursement" do
    visible true
    label "Rimborso Spese"
    label_plural "Rimborsi Spese"
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
