//Numbers of crimes per year
db.crimes.aggregate([
    {
        "$group" : 
        {
            _id:"$year",
            count:{$sum:1}
        }
    }
])

//Crimes in 2017 (listed)
db.crimes.find(
    {
        year: 2017
    }
)

//Crimes in 2017 (aggregated)
db.crimes.aggregate([
    {
        "$match" : {year: 2017}
    },
    {
        "$group" : 
        {
            _id:"$year",
            count:{$sum:1}
        }
    }
])

//3T GENERATED: Number of crimes per year
db.crimes.aggregate(
    [
        { 
            "$group" : { 
                "_id" : { 
                    "year" : "$year"
                }, 
                "COUNT(*)" : { 
                    "$sum" : NumberInt(1)
                }
            }
        }, 
        { 
            "$project" : { 
                "year" : "$_id.year", 
                "COUNT(*)" : "$COUNT(*)", 
                "_id" : NumberInt(0)
            }
        }, 
        { 
            "$sort" : { 
                "COUNT(*)" : NumberInt(-1)
            }
        }, 
        { 
            "$limit" : NumberInt(10)
        }
    ]
);