db = db.getSiblingDB("chicago_crimes");
db.getCollection("phase2_part2").aggregate(
    [
        {
        // district is not null 
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
                }
            }
        }, 
        { 
            "$project" : { 
                "district" : "$_id.district", 
                "primary_type" : "$_id.primary_type", 
                "_id" : NumberInt(0)
            }
        }, 
        { 
            "$sort" : { 
                "district" : NumberInt(1), 
                "primary_type" : NumberInt(1)
            }
        }
    ], 
    { 
        "allowDiskUse" : true
    }
);
