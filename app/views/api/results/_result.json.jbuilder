json.place result.overall_place
json.first_name result.first_name
json.time format_hours result.secs
json.last_name result.last_name
json.bib result.bib
json.city result.city
json.state result.state
json.gender result.gender
json.gender_place result.gender_place
json.group result.group.name
json.group_place result.group_place
json.swim format_hours  result.swim_secs  #  " 0:#{format_minutes result.swim.secs}"
json.pace_100 format_minutes result.swim_pace_100
# json.t1_secs formate_seconds result.t1
json.bike format_hours result.bike_secs
json.mph  format_mph result.bike_mph
# json.t2_secs formate_seconds result.t2
json.run format_hours result.run_secs
# json.run_mmile formate_time result.mmile

json.mmile format_minutes result.run_mmile
json.result_url api_race_result_url(result.race.id, result)
if result.racer.id
  json.racer_url api_racer_url(result.racer.id)
end
