// distribution of other crimes
db.getCollection("crime").aggregate(
    [
        {
            "$match" : {
                "primary_type" : "OTHER OFFENSE"
            }
        },
        {
            "$group" : {
                "_id" : {
                    "description" : "$description"
                },
                "COUNT(*)" : {
                    "$sum" : NumberInt(1)
                }
            }
        },
        {
            "$project" : {
                "description" : "$_id.description",
                "num_crimes" : "$COUNT(*)",
                "_id" : NumberInt(0)
            }
        },
        {
            "$sort" : {
                "COUNT(*)" : NumberInt(-1)
            }
        }
    ],
    {
        "allowDiskUse" : true
    }
);
