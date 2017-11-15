namespace :utils do
  desc "Popula o banco de dados." #descrição da task
  task seed: :environment do #enviroment carrega os dados da aplicação para utilizar dentro do arquivo utils

  	puts "Gerando os contatos (Contacts)..."

	10.times do |i|
		Contact.create!(  name: Faker::DragonBall.character,
						  email: Faker::Internet.email,
						  kind: Kind.all.sample,
						  rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
						  )
	end
	puts "Gerando os contatos (Contacts)...[Gerado com sucesso]"

	puts "Gerando os endereços (Addresses)..."

	Contact.all.each do|_contact|
		Address.create!(street: Faker::Address.street_name,
						city: Faker::Address.city,
						state: Faker::Address.state,
						contact: _contact)
	end
	puts "Gerando os endereços (Addresses)...[Gerado com sucesso]"

	puts "Gerando os telefones (Phones)..."

	Contact.all.each do|_contact|
		Random.rand(1..5).times do |i|
		Phone.create!(phone:Faker::PhoneNumber.cell_phone,
					  contact: _contact )
		end
	end
	puts "Gerando os telefones (Phones)...[Gerado com sucesso]"
  end


end

