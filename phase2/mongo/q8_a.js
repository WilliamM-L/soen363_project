db = db.getSiblingDB("chicago_crimes");
db.getCollection("crime").aggregate(
    [
        { 
            "$group" : { 
                "_id" : { 
                    "primary_type" : "$primary_type", 
                    "location_description" : "$location_description"
                }, 
                "COUNT(_id)" : { 
                    "$sum" : NumberInt(1)
                }
            }
        }, 
        { 
            "$project" : { 
                "location_description" : "$_id.location_description", 
                "primary_type" : "$_id.primary_type", 
                "num_crimes" : "$COUNT(_id)", 
                "_id" : NumberInt(0)
            }
        }, 
        { 
            "$sort" : { 
                "num_crimes" : NumberInt(-1)
            }
        }
    ], 
    { 
        "allowDiskUse" : true
    }
);
