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
