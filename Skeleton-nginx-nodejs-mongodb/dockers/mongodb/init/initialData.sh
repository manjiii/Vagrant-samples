mongo <<-SHELL
     use manjiii_db;
     db.createCollection("manjiii_clctn");
     db.manjiii_clctn.insert({name:"manjiii1",age:"3",sex:"male"})
     db.manjiii_clctn.insert({name:"manjiii2",age:"32",sex:"female"})
     db.manjiii_clctn.insert({name:"manjiii3",age:"13",sex:"female"})
     db.manjiii_clctn.insert({name:"manjiii4",age:"51",sex:"male"})
SHELL