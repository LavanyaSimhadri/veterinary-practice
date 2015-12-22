json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :date_of_visit, :pet_id, :user_id, :reminder_of_appointment, :reason_for_visit
  json.url appointment_url(appointment, format: :json)
end
