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
                "most_popular_crime_location" : "$COUNT(*)", 
                "_id" : NumberInt(0)
            }
        }, 
        { 
            "$sort" : { 
                "most_popular_crime_location" : NumberInt(-1)
            }
        }
    ], 
    { 
        "allowDiskUse" : true
    }
);
