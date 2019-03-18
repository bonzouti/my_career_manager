require 'faker'

User.destroy_all
puts('Old users destroyed')

    bere = User.create!(email: "berenice@yopmail.com", password: Faker::String.random(8), is_admin: false, country: "France", full_name: "Bérénice")
    mathieu = User.create!(email: "mathieu@yopmail.com", password: Faker::String.random(8), is_admin: false, country: "France", full_name: "Matt")
    elo = User.create!(email: "elo@yopmail.com", password: Faker::String.random(8), is_admin: false, country: "France", full_name: "Elo")
    lionel = User.create!(email: "lionel@yopmail.com", password: Faker::String.random(8), is_admin: false, country: "France", full_name: "Lion")
    superadmin = User.create!(email: "superadmin@yopmail.com", password: "azerty2020", is_admin: true, country: "France", full_name: "Gauthier")
    superadmin.is_admin = false 
    superadmin.save

puts('New users seeded')

status = ["identified", "applied", "in_progress", "archived"]
categories = ["interview", "phone interview", "application sent", "follow-up"]


Application.destroy_all
puts('Old applications destroyed')
Step.destroy_all
puts('Old steps destroyed')

40.times do
    application = Application.create!(company_name: ["Google", "Toutiao", "Didi", "Uber", "WeWork", "Aribnb", "SpaceX", 
    "Stripe", "Palantir", "Lyft", "Coinbase", "Slack", "Tokopedia", "Vice Media", "Oyo rooms", "Magic Leaps", "Deezer", 
    "Ventes-privées", "Blablacar", "Doctolib","Nubank", "Amazon", "OVH", "Station F", "Niantic", "Ubisoft", "Preferred Networks",
    "Aurora", "InVision", "Quora", "Sprinklr", "Pinterest", "Buzzfeed", "Devoted Health", "Caocao", "Looker", 
    "Oxford Nanopores Technologies", "Mu Sigma", "Nextdoor", "Gett", "Hike", "Allbirds", "Warby Parker", "OfferUp", "Postmates", 
    "VivaRepublica", "Tradeshift", "Jumia", "Techstyle Fashion Group", "MarkLogic", "Deliveroo", "JustEat", "Frichti", "Nestor",
    "Revolut", "GraphCore", "Cabify", "Taxify", "Chauffeur-Privé-Kapten", "Accenture", "Facebook", "WeChat", "Bank of China" ].sample, 
        position: ["Front-end Developer", "Ruby Developer", "Fullstack Developer", "RoR Developer", "Happiness Manager", "Digital Guru and Tech Evangelist"].sample, 
        user: User.all.sample, 
        status: "identified",
        notes: Faker::Lorem.paragraph(3),
        joboffer_link: Faker::Internet.url, 
        joboffer_description: Faker::Company.bs )
end 
puts('Identified applications created')


Step.destroy_all
puts('Old steps destroyed')
30.times do |i|
    step = Step.create!(category: "application sent", 
    title: ["Cover Letter and Resume Send", "Resume only"].sample, 
    status: "true", 
    application: Application.all[i],
    date: Faker::Date.backward(60) )
    step.application.status = "applied"
    step.application.save
end 

20.times do |i|
    step = Step.create!(category: ["interview", "phone interview", "follow-up"].sample, 
    title: ["Great Feeling", "Dream job", "Dushbag guy", "Talked about my impressive experiences"].sample, 
    description: Faker::Company.bs, 
    status: [true, false].sample, 
    application: Application.all[i],
    date: Faker::Date.forward(60) )

    step.application.status = "in_progress"
    step.application.save
end 

puts('New steps created')


Contact.destroy_all
puts('Old contacts destroyed')
20.times do
    contact = Contact.create!(first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email, 
    phone: Faker::PhoneNumber.phone_number, 
    application: Application.all.sample, position: ["HR Manager", "CEO", "Talent Acquisition Specialist"].sample )
end 
puts('New contacts created')

2.times do
    application = Application.all.sample
    application.status = "archived"
    application.save
end 

puts "Steps status updated considering steps"
