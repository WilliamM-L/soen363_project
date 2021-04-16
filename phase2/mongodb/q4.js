//Crimes per ward per year
db.crimes.aggregate([
    {
        "$group" : 
        {
            _id:{year: "$year", ward: "$ward"},
            count:{$sum:1}
        }
    }
])

//Crimes per ward overall
db.crimes.aggregate([
    {
        "$group" : 
        {
            _id:{ward: "$ward"},
            count:{$sum:1}
        }
    }
])