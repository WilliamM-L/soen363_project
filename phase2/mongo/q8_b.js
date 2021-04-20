db = db.getSiblingDB("chicago_crimes");
db.getCollection("crime").aggregate(
    [
        { 
            "$group" : { 
                "_id" : { 
                    "location_description" : "$location_description"
                }, 
                "COUNT(*)" : { 
                    "$sum" : NumberInt(1)
                }
            }
        }, 
        { 
            "$project" : { 
                "location_description" : "$_id.location_description", 
                "COUNT(*)" : "$COUNT(*)", 
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
