db = db.getSiblingDB("chicago_crimes");
db.getCollection("crime").aggregate(
    [
        { 
            "$match" : { 
                "primary_type" : "ARSON", 
                "location_description" : /^ABANDONED.*$/i
            }
        }, 
        { 
            "$group" : { 
                "_id" : { 

                }, 
                "COUNT(*)" : { 
                    "$sum" : NumberInt(1)
                }
            }
        }, 
        { 
            "$project" : { 
                "num_of_cases" : "$COUNT(*)", 
                "_id" : NumberInt(0)
            }
        }
    ], 
    { 
        "allowDiskUse" : true
    }
);
