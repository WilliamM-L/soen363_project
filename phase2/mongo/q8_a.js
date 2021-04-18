db = db.getSiblingDB("chicago_crimes");
db.getCollection("phase2_part2").aggregate(
    [
        {
        // location_description not null
            "$match" : { 
                "location_description" : { 
                    "$ne" : null
                }
            }
        }, 
        { 
            "$group" : { 
                "_id" : { 
                    "primary_type" : "$primary_type", 
                    "location_description" : "$location_description"
                }
            }
        }, 
        { 
            "$project" : { 
                "location_description" : "$_id.location_description", 
                "primary_type" : "$_id.primary_type", 
                "_id" : NumberInt(0)
            }
        }, 
        { 
            "$sort" : { 
                "location_description" : NumberInt(1), 
                "primary_type" : NumberInt(1)
            }
        }
    ], 
    { 
        "allowDiskUse" : true
    }
);
