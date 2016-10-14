# Create First User (Admin)

user = User.create! :nome => 'Admin', :email => 'admin@doar.libertais.org', :password => '123456789', :password_confirmation => '123456789', :admin => 't'
