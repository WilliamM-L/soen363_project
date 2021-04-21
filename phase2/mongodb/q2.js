//Count of crimes per type of crime
db.crime.aggregate(
    [
        {
            "$group" : {
                "_id" : {
                    "primary_type" : "$primary_type"
                },
                "COUNT(cid)" : {
                    "$sum" : NumberInt(1)
                }
            }
        },
        {
            "$project" : {
                "primary_type" : "$_id.primary_type",
                "num_crimes_of_type" : "$COUNT(cid)",
                "_id" : NumberInt(0)
            }
        },
        {
            "$sort" : {
                "num_crimes_of_type" : NumberInt(-1)
            }
        }
    ],
    {
        "allowDiskUse" : true
    }
);

//Homicides per year
db.crime.aggregate([
    {
        "$group" :
        {
            _id:{year: "$year", primary_type: /^HOMICIDE/},
            count:{$sum:1}
        }
    }
])
