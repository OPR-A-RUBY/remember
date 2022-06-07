# persons.rb

get '/person/new' do
  erb :person_new
end

get '/person/edit' do
  erb :person_edit
end

get '/person/delete' do
  erb :person_delete
end