//Crimes per district per year
db.crimes.aggregate([
    {
        "$group" : 
        {
            _id:{year: "$year", district: "$district"},
            count:{$sum:1}
        }
    }
])

//Crimes per district overall
db.crimes.aggregate([
    {
        "$group" : 
        {
            _id:{district: "$district"},
            count:{$sum:1}
        }
    }
])