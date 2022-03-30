puts '🌱 Seeding spices...'
profile_url = [
  "https://thefinancialdiet.com/wp-content/uploads/2019/12/MV5BODFlZDc0ZWItY2Q1YS00NTMyLTkzNjktZTQ0YzNlYWQ4Y2MwXkEyXkFqcGdeQXVyNzAwMTc4OTY@._V1_SY1000_CR0015001000_AL_-1024x732.jpg",
  "https://pantograph-punch.com/derivations/image/fill/1920/1080/eyJpZCI6ImltYWdlLzU0OC9hdHRhY2htZW50L2NiNzgwMDhlYTk1M2YxNDAyMTk4Y2UzMjU0NDc0ZmVkLmpwZyIsInN0b3JhZ2UiOiJzdG9yZSJ9?signature=a87632fd0d454e24947f91951c3bd144db03bd251e8a002f4b763505f596d195",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFEEPCcj0C1dc5c7ULehYR1AzQZESgYXAqZg&usqp=CAU", 
   'https://www.thecitizen.in//NewsImages/119008ivKhVt9jZzU0-1.jpg',
   'https://www.borgenmagazine.com/wp-content/uploads/2020/08/Poor-People-Are-Happier-1.jpg',
   'https://s3.ca-central-1.amazonaws.com/files.compassion.ca/www/wp-content/uploads/2017/01/06082206/KE-family.jpg',
   'https://static01.nyt.com/images/2020/10/15/us/politics/15dc-poverty-2/15dc-poverty-2-mediumSquareAt3X-v4.jpg',
   'https://t4.ftcdn.net/jpg/00/42/54/09/360_F_42540925_4CpvCPsIfIGpe1NPamj0gqzz51fpYAOT.jpg',
   'https://www.guelphdentist.com/wp-content/uploads/2015/02/Poor-Dental-Health-Linked-to-Poor-Family-Environment.jpg',
   'https://files.globalgiving.org/pfil/46208/pict_large.jpg?m=1585922567000',
   'https://compote.slate.com/images/22ee6111-e168-4a10-bdbd-b0f732d4552c.jpg',
   'https://miro.medium.com/max/1140/1*6hy3AXS5V06rwG0OEl891Q.jpeg',
   'https://media.istockphoto.com/photos/woman-comforts-daughter-at-clothing-drive-picture-id514225940?k=20&m=514225940&s=612x612&w=0&h=BLkdhavqtpcC7S7rnbHxiRv0yIp000dlFYzrDyOzibk=',
  #  'https://family.jrank.org/article_images/ep201102/family/family1314.jpg',
   'https://www.thesun.co.uk/wp-content/uploads/2018/04/nintchdbpict000401741180.jpg',
   'https://cdn.talkpoverty.org/content/uploads/2019/11/26102530/GettyImages-1180048076-937x625.jpg'



]


# Seed your database here

25.times {
  User.create(
    {
      first_name: Faker::Name.unique.first_name,
      last_name: Faker::Name.unique.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      city: 'District of Columbia',
      profile_url: profile_url.sample,
    },
  )
}

10.times {Gpost.create({comment:Faker::Lorem.paragraph(sentence_count: 2), likes:Faker::Number.number(digits: 3), user_id:User.all.sample.id})}

 23.times {Hpost.create({
  title:Faker::Lorem.sentence(word_count: 4), 
 h_request:Faker::Lorem.paragraph(sentence_count: 3),
  user_id:User.all.sample.id})}


puts '✅ Done seeding!'
