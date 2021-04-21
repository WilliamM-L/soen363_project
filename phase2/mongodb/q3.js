// Wards and their numbers of crime
db.getCollection("crime").aggregate(
    [
        {
            "$match" : {
                "ward" : {
                    "$ne" : null
                }
            }
        },
        {
            "$group" : {
                "_id" : {
                    "ward" : "$ward"
                },
                "COUNT(*)" : {
                    "$sum" : NumberInt(1)
                }
            }
        },
        {
            "$project" : {
                "ward" : "$_id.ward",
                "COUNT(*)" : "$COUNT(*)",
                "_id" : NumberInt(0)
            }
        },
        {
            "$sort" : {
                "ward" : NumberInt(1)
            }
        }
    ],
    {
        "allowDiskUse" : true
    }
);

// Visualisation queries

// percentage distribution
