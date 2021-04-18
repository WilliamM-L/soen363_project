//Crimes in 2017 (listed)
db.crimes.find(
    {
        year: 2008
    }
)

//Crimes in 2017 (aggregated)
db.crimes.aggregate([
    {
        "$match" : {year: 2008}
    },
    {
        "$group" : 
        {
            _id:"$year",
            count:{$sum:1}
        }
    }
])

//Number of crimes per year
db.crimes.aggregate(
    [
        { 
            "$match" : { 
                "year" : { 
                    "$ne" : NumberLong(41)
                }
            }
        }, 
        { 
            "$group" : { 
                "_id" : { 
                    "year" : "$year"
                }, 
                "COUNT(cid)" : { 
                    "$sum" : NumberInt(1)
                }
            }
        }, 
        { 
            "$project" : { 
                "year" : "$_id.year", 
                "num_crimes" : "$COUNT(cid)", 
                "_id" : NumberInt(0)
            }
        }, 
        { 
            "$sort" : { 
                "year" : NumberInt(1)
            }
        }
    ], 
    { 
        "allowDiskUse" : true
    }
);