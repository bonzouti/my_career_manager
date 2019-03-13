require 'faker'

User.destroy_all
puts('Old users destroyed')

    bere = User.create!(email: "berenice@yopmail.com", password: "azerty2020")
    mathieu = User.create!(email: "mathieu@yopmail.com", password: "azerty2020")
    elo = User.create!(email: "elo@yopmail.com", password: "azerty2020")
    lionel = User.create!(email: "lionel@yopmail.com", password: "azerty2020")
    gauthier = User.create!(email: "gauthier@yopmail.com", password: "azerty2020")

puts('New users seeded')

status = ["identified", "applied", "in_progress", "archived"]
categories = ["interview", "phone interview", "application sent", "follow-up"]

Application.destroy_all
puts('Old applications destroyed')
20.times do
    application = Application.create!(company_name: Faker::Company.unique.name, 
        position: ["Front-end Developer", "Ruby Developer", "Fullstack Developer", "RoR Developer"].sample, 
        user: User.all.sample, status: "identified",
        notes: Faker::Lorem.paragraph(3),
        joboffer_link: Faker::Internet.url, 
        joboffer_description: Faker::Company.bs )
end 
puts('New applications created')

Contact.destroy_all
puts('Old contacts destroyed')
10.times do
    contact = Contact.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, application: Application.all.sample, position: ["HR Manager", "CEO", "Talent Acquisition Specialist"].sample )
end 
puts('New contacts created')


Step.destroy_all
puts('Old steps destroyed')
15.times do
    step = Step.create!(category: categories.sample, title: Faker::Company.buzzword, description: Faker::Company.bs, status: [true, false].sample, application: Application.all.sample, date: Faker::Date.forward(60) )
end 
puts('New steps created')


Step.all.each do |step| 
    if (step.category == "interview" || step.category == "follow-up" || step.category == "phone interview")
        step.application.status = "in_progress" 

    elsif(step.category == "application sent" && step.application.status != "in_progress")
        step.application.status = "applied" 
    end

    step.application.save

end 



2.times do
    application = Application.all.sample
    application.status = "archived"
    application.save
end 

puts "Steps status updated considering steps"
