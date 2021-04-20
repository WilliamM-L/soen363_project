db = db.getSiblingDB("chicago_crimes");
db.getCollection("crime").aggregate(
    [
        { 
            "$match" : { 
                "district" : { 
                    "$ne" : null
                }
            }
        }, 
        { 
            "$group" : { 
                "_id" : { 
                    "district" : "$district", 
                    "primary_type" : "$primary_type"
                }, 
                "COUNT(_id)" : { 
                    "$sum" : NumberInt(1)
                }
            }
        }, 
        { 
            "$project" : { 
                "district" : "$_id.district", 
                "primary_type" : "$_id.primary_type", 
                "num_crimes" : "$COUNT(_id)", 
                "_id" : NumberInt(0)
            }
        }, 
        { 
            "$sort" : { 
                "num_crimes" : NumberInt(-1)
            }
        }, 
        { 
            "$limit" : NumberInt(50)
        }
    ], 
    { 
        "allowDiskUse" : true
    }
);
