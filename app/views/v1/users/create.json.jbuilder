json.data do
  json.message :SUCCESS
  json.user do
    json.id @user.id
    json.email @user.email
  end
end