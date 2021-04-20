db = db.getSiblingDB("chicago_crimes");
db.getCollection("crime").aggregate(
    [
        {
        /* 
        matches the primary type to either theft, battery, criminal damage or 
        homocide 
        */ 
            "$match" : { 
                "$or" : [
                    { 
                        "primary_type" : /^THEFT$/i
                    }, 
                    { 
                        "primary_type" : /^BATTERY$/i
                    }, 
                    { 
                        "primary_type" : /^CRIMINAL DAMAGE$/i
                    }, 
                    { 
                        "primary_type" : /^HOMICIDE$/i
                    }
                ]
            }
        }, 
        { 
            "$group" : { 
                "_id" : { 
                    "primary_type" : "$primary_type", 
                    "year" : "$year"
                }, 
                "COUNT(case_number)" : { 
                    "$sum" : NumberInt(1)
                }
            }
        }, 
        { 
            "$project" : { 
                "year" : "$_id.year", 
                "primary_type" : "$_id.primary_type", 
                "COUNT(case_number)" : "$COUNT(case_number)", 
                "_id" : NumberInt(0)
            }
        }, 
        { 
            "$group" : { 
                "_id" : null, 
                "distinct" : { 
                    "$addToSet" : "$$ROOT"
                }
            }
        }, 
        { 
            "$unwind" : { 
                "path" : "$distinct", 
                "preserveNullAndEmptyArrays" : false
            }
        }, 
        { 
            "$replaceRoot" : { 
                "newRoot" : "$distinct"
            }
        }, 
        { 
            "$sort" : { 
                "year" : NumberInt(-1), 
                "COUNT(case_number)" : NumberInt(-1)
            }
        }
    ], 
    { 
        "allowDiskUse" : true
    }
);
